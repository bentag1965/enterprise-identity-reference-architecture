# Emergency Access

Emergency-access identities exist to recover administrative control when normal identity controls fail.

## Design Goals

- independent from ordinary administrator identities
- protected with strong credentials and operational controls
- minimal number of accounts
- no day-to-day use
- monitored for every sign-in or attempted sign-in
- documented recovery procedure
- regularly tested

## Important Boundary

Emergency access should not depend on the same Conditional Access, federation, device, or identity-provider dependency whose failure it is meant to recover.

## Operational Controls

- named owner and backup owner
- credential escrow/recovery process
- sign-in alerting
- periodic validation
- post-use credential rotation
- post-use incident review
