# Workload Identities

Applications and automation identities need lifecycle controls just as human identities do.

## Required Metadata

Each workload identity should have:

- business owner
- technical owner
- purpose
- allowed resources
- granted permissions
- credential type
- credential expiration
- rotation procedure
- last-used evidence where available

## Preferred Controls

- managed identity or certificate-based authentication where practical
- avoid long-lived shared secrets
- least-privilege API permissions
- separate dev/test/prod identities
- monitor unused or ownerless principals
- remove credentials before deleting the application object when decommissioning

## High-Risk Conditions

- broad application permissions
- no owner
- never-expiring secret
- credentials embedded in code
- single identity reused across unrelated systems
- no activity monitoring
