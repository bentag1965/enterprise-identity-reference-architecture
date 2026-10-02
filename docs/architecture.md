# Architecture

## Layers

### 1. Authoritative identity source

A trusted system owns employment or affiliation state. Identity provisioning consumes that state rather than inventing its own employee lifecycle.

### 2. Identity provider

The identity provider owns authentication, tokens, identity objects, enterprise application integration, and central access policy.

### 3. Authorization

Authorization should flow primarily through security groups, application roles, and platform RBAC rather than direct user assignments.

### 4. Privilege plane

Administrative roles are separated from ordinary productivity access. Privileged roles should be eligible where practical, activated only when needed, and logged.

### 5. Policy plane

Conditional Access evaluates contextual controls such as authentication strength, user/risk class, device posture, resource sensitivity, and operational exception.

### 6. Workload identities

Applications and automation require identities with explicit owners, minimal permissions, credential rotation, and activity monitoring.

### 7. Observability

Sign-in, audit, privilege, provisioning, and workload-identity events feed operational monitoring and incident response.

## Trust Boundaries

- authoritative source -> identity provider
- identity provider -> SaaS application
- user -> privileged role
- workload identity -> API/resource
- emergency account -> administrative plane
- identity telemetry -> monitoring/SIEM

Each boundary should have explicit authentication, authorization, logging, and recovery assumptions.
