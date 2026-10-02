# Case Study: Identity Modernization for a Distributed Enterprise

## Situation

A distributed organization has grown through multiple teams and acquisitions. Access is inconsistent, administrators hold broad standing privilege, SaaS assignments are partly direct, and offboarding depends on manual tickets.

## Risks

- orphaned access after role changes
- inconsistent MFA coverage
- excessive privileged access
- unclear application ownership
- direct assignments that bypass lifecycle automation
- service principal credentials with weak ownership
- no tested emergency-access procedure

## Target Architecture

1. establish an authoritative identity source
2. normalize joiner/mover/leaver workflows
3. convert common access into role groups
4. reduce direct application assignments
5. convert standing administrative roles to eligible/time-bound access where practical
6. implement layered Conditional Access
7. create independent emergency-access identities
8. inventory workload identities and credential age
9. centralize identity audit and sign-in monitoring
10. establish recurring access reviews

## Migration Strategy

### Phase 1: Inventory

Document users, groups, apps, roles, workload identities, authentication methods, policies, and direct assignments.

### Phase 2: Stabilize

Protect privileged identities, establish emergency access, remove obvious dormant risk, and identify ownerless applications.

### Phase 3: Normalize access

Move repeatable access into groups and role definitions. Establish lifecycle ownership and expiration for exceptions.

### Phase 4: Enforce policy

Introduce Conditional Access in controlled stages, measure impact, and remove legacy exceptions.

### Phase 5: Operate

Track metrics, access reviews, credential expiration, privileged activity, and incident response readiness.

## Success Criteria

- lower standing privilege
- fewer direct user assignments
- complete owner coverage for workload identities
- tested emergency-access path
- measurable joiner/mover/leaver completion
- actionable identity alerts
- auditable privileged changes
