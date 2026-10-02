# Identity Lifecycle

## Joiner

A new identity should be created from an authoritative source and receive only baseline access plus role-based entitlements.

Recommended controls:

- unique immutable identity key
- manager and department ownership
- group-based baseline access
- time-bound pre-start access when required
- MFA registration workflow
- device enrollment dependencies kept separate from account creation

## Mover

Role changes are security events, not merely additive provisioning events.

A mover workflow should:

1. identify access no longer justified by the old role
2. remove obsolete group and application membership
3. add new role-based entitlement
4. review privileged assignments
5. preserve audit evidence of before/after access

## Leaver

Termination handling should prioritize containment and then cleanup.

Typical sequence:

1. block sign-in
2. revoke active sessions/tokens
3. remove privileged eligibility and standing roles
4. disable workload credentials uniquely owned by the user
5. remove group/application access
6. preserve mailbox/data according to policy
7. transfer ownership of business-critical resources
8. remove or delete the identity according to retention policy

## Exceptions

Exceptions should be data with owner, reason, approval, and expiration—not undocumented permanent bypasses.
