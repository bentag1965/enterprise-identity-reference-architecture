# ADR 002: Eligible Privilege Over Standing Privilege

## Decision

Use eligible, time-bound privileged access where operationally practical rather than permanent administrative assignment.

## Why

This reduces the period during which a compromised account carries elevated authority and creates a clearer activation audit trail.

## Tradeoff

Emergency operations require a documented fallback and should not depend solely on the privileged-elevation service.
