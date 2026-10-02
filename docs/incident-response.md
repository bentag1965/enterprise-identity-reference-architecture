# Identity Incident Response

## Example: Suspected Privileged Account Compromise

### Immediate containment

1. disable or block the affected identity if justified
2. revoke active sessions and refresh tokens
3. remove or deactivate privileged role assignments
4. identify recent role, group, application-consent, and credential changes
5. protect evidence before broad cleanup

### Scope analysis

Investigate:

- sign-in geography and device context
- Conditional Access result
- MFA method changes
- new service principals or credentials
- application consent grants
- group/role changes
- mailbox or collaboration persistence mechanisms where relevant

### Recovery

- reset credentials and authentication methods
- restore justified access only
- rotate affected application secrets/certificates
- validate privileged-role configuration
- verify emergency access remains functional
- monitor for re-entry or persistence

### Lessons

Identity incidents often cross user, application, workload, and privilege boundaries. Recovery must verify all of them rather than treating password reset as sufficient.
