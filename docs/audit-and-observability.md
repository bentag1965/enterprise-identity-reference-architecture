# Audit and Observability

## Signals to Preserve

- successful and failed sign-ins
- MFA and authentication-method events
- Conditional Access outcomes
- privileged role activation
- role assignment changes
- group membership changes
- application consent and permission changes
- service principal credential changes
- provisioning failures
- emergency-account activity

## Operational Metrics

Useful identity metrics include:

- privileged accounts by role
- standing vs eligible privilege
- accounts without strong authentication
- dormant enabled accounts
- failed provisioning operations
- ownerless service principals
- credentials expiring within threshold
- direct assignments outside the group model
- emergency-account sign-in count

## Alerting Principle

Alert on conditions that require action, not merely on every event.
