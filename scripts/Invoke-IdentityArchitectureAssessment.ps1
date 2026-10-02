[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Path,

    [int]$DormantDays = 90,
    [int]$CredentialWarningDays = 30,
    [int]$EmergencyTestMaxDays = 60
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Path)) {
    throw "Snapshot not found: $Path"
}

$snapshot = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
$findings = [System.Collections.Generic.List[object]]::new()

function Add-Finding {
    param(
        [string]$Severity,
        [string]$Control,
        [string]$Subject,
        [string]$Message
    )

    $findings.Add([pscustomobject]@{
        Severity = $Severity
        Control  = $Control
        Subject  = $Subject
        Message  = $Message
    })
}

foreach ($user in @($snapshot.users)) {
    $isPrivileged = @($user.roles).Count -gt 0

    if ($isPrivileged -and -not $user.mfaRegistered) {
        Add-Finding -Severity 'Critical' -Control 'Privileged MFA' -Subject $user.displayName `
            -Message 'Privileged identity does not show MFA registration.'
    }

    if ($isPrivileged -and $user.assignmentType -eq 'standing') {
        Add-Finding -Severity 'High' -Control 'Standing Privilege' -Subject $user.displayName `
            -Message 'Privileged role is standing rather than eligible/time-bound.'
    }

    if ($user.enabled -and $user.lastSignInDaysAgo -ge $DormantDays) {
        Add-Finding -Severity 'Medium' -Control 'Dormant Account' -Subject $user.displayName `
            -Message "Enabled identity has not signed in for $($user.lastSignInDaysAgo) days."
    }

    foreach ($assignment in @($user.directAssignments)) {
        Add-Finding -Severity 'Low' -Control 'Direct Assignment' -Subject $user.displayName `
            -Message "Direct assignment bypasses the preferred group model: $assignment"
    }
}

$emergencyAccounts = @($snapshot.emergencyAccessAccounts)
if ($emergencyAccounts.Count -lt 2) {
    Add-Finding -Severity 'High' -Control 'Emergency Access' -Subject 'Tenant' `
        -Message 'Fewer than two emergency-access accounts are represented.'
}

foreach ($account in $emergencyAccounts) {
    if (-not $account.enabled) {
        Add-Finding -Severity 'Critical' -Control 'Emergency Access' -Subject $account.id `
            -Message 'Emergency-access account is disabled.'
    }

    if (-not $account.monitored) {
        Add-Finding -Severity 'High' -Control 'Emergency Access Monitoring' -Subject $account.id `
            -Message 'Emergency-access account is not marked as monitored.'
    }

    if ($account.lastTestDaysAgo -gt $EmergencyTestMaxDays) {
        Add-Finding -Severity 'Medium' -Control 'Emergency Access Testing' -Subject $account.id `
            -Message "Emergency-access validation is older than $EmergencyTestMaxDays days."
    }
}

foreach ($sp in @($snapshot.servicePrincipals)) {
    if (@($sp.owners).Count -eq 0) {
        Add-Finding -Severity 'High' -Control 'Workload Ownership' -Subject $sp.name `
            -Message 'Workload identity has no recorded owner.'
    }

    if ($sp.credentialDaysRemaining -le $CredentialWarningDays) {
        Add-Finding -Severity 'Medium' -Control 'Credential Rotation' -Subject $sp.name `
            -Message "Credential expires in $($sp.credentialDaysRemaining) days."
    }
}

$severityOrder = @{ Critical = 1; High = 2; Medium = 3; Low = 4 }
$sorted = $findings | Sort-Object @{ Expression = { $severityOrder[$_.Severity] } }, Control, Subject

$summary = [pscustomobject]@{
    Users                 = @($snapshot.users).Count
    EmergencyAccounts     = $emergencyAccounts.Count
    ServicePrincipals     = @($snapshot.servicePrincipals).Count
    CriticalFindings      = @($sorted | Where-Object Severity -eq 'Critical').Count
    HighFindings          = @($sorted | Where-Object Severity -eq 'High').Count
    MediumFindings        = @($sorted | Where-Object Severity -eq 'Medium').Count
    LowFindings           = @($sorted | Where-Object Severity -eq 'Low').Count
}

Write-Host ''
Write-Host 'Identity Architecture Assessment'
Write-Host '--------------------------------'
$summary | Format-List

if (@($sorted).Count -gt 0) {
    $sorted | Format-Table -AutoSize
}
else {
    Write-Host 'No findings for the supplied snapshot.'
}

[pscustomobject]@{
    Summary  = $summary
    Findings = @($sorted)
}
