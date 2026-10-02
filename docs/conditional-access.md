# Conditional Access

Conditional Access should be treated as a policy system with explicit scope and exclusions.

## Policy Categories

### Baseline authentication

Require MFA or stronger authentication for normal interactive access, with documented exceptions.

### Administrative access

Use stronger authentication and tighter context requirements for privileged roles and management portals.

### Device-aware access

Sensitive applications may require compliant or managed devices.

### Legacy authentication

Block protocols or clients that cannot satisfy modern controls where business requirements permit.

### Risk-sensitive access

Identity or sign-in risk signals may trigger stronger authentication, password reset, block, or investigation depending on the risk model.

## Design Rules

- build policies in report-only/test mode before broad enforcement where supported
- exclude emergency-access accounts deliberately and minimally
- document policy intent, scope, dependencies, and rollback path
- avoid overlapping policies whose combined result is difficult to reason about
- validate service/workload identities separately from interactive users

## Failure Mode to Avoid

A policy that is individually sensible can still cause an outage when combined with another policy, device-state dependency, or authentication-method restriction.
