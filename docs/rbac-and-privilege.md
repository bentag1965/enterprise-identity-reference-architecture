# RBAC and Privileged Access

## Authorization Model

Prefer:

```text
User -> Role Group -> Application Role / Platform RBAC -> Resource
```

over:

```text
User -> Direct Resource Assignment
```

## Privilege Model

Administrative privilege should be separated into:

- normal user identity
- privileged administrative identity where required
- eligible role assignment
- activation with justification
- time-bound elevated session
- audit trail

## Controls

- minimize standing global or tenant-wide administration
- require strong authentication for privileged activation
- avoid shared administrative accounts
- review eligible and active role assignment regularly
- expire temporary project/admin grants
- maintain role-specific admin groups where supported
- monitor privilege escalation and role assignment changes

## Separation of Duties

High-impact workflows may require separate roles for:

- identity administration
- security monitoring
- application administration
- billing/licensing
- privileged-role administration

The exact split depends on organization size and operational maturity.
