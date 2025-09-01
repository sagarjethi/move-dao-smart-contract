# MoveDAO – Modular On‑Chain Governance (Aptos)

General‑purpose DAO contract for Aptos. Create DAOs that can propose, vote, queue and execute treasury actions.

- Core module: `addr::governance` in `sources/dao.move`
- Package: `Move.toml`

## Features
- Proposals with timelocks and quorum checks
- Voting strategies (simple majority placeholder, extensible)
- Delegations mapping (simple placeholder)
- Treasury with AptosCoin deposits and proposal‑driven payouts
- Events: initialization, creation, vote cast, executed

## Quickstart
Prereq: Aptos CLI installed and account initialized.

```bash
# Compile & test
aptos move compile
aptos move test

# Publish (example; set your profile)
aptos move publish --profile default

# Initialize DAO (example)
# Name: "My DAO", voting_period: 3 days, timelock: 1 hour, quorum: 25%, proposal threshold: 1, strategy: simple, veto disabled
aptos move run --function-id '<your_addr>::governance::initialize_dao' \
  --args string:"My DAO" u64:259200 u64:3600 u64:2500 u64:1 u8:0 bool:false address:none
```

## Scripts
See `scripts/` for one‑liners: compile, test, publish, initialize.

## Reference
Inspired by patterns in Aptos and community DAO repos like AptosPad [`https://github.com/aptospad-app/aptospad-move`](https://github.com/aptospad-app/aptospad-move).

## License
MIT
