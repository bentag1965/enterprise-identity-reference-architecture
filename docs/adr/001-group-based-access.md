# ADR 001: Group-Based Access by Default

## Decision

Use groups or application roles as the normal authorization boundary instead of direct per-user assignment.

## Why

Group-based access improves lifecycle automation, reviewability, delegation, and auditability.

## Exception

Direct assignment may be justified for temporary or product-limited cases, but it should have an owner, reason, and expiration.
