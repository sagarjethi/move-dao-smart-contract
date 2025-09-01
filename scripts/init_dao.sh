#!/usr/bin/env bash
set -euo pipefail
PROFILE=${1:-default}
NAME=${2:-"My DAO"}
VOTING_PERIOD=${3:-259200}
TIMELOCK=${4:-3600}
QUORUM=${5:-2500}
PROPOSAL_THRESHOLD=${6:-1}
STRATEGY=${7:-0}
VETO_ENABLED=${8:-false}
VETO_AUTH=${9:-none}
ADDR=$(aptos config show-profiles --profile "$PROFILE" | awk '/Account/{print $2}')
if [ -z "$ADDR" ]; then echo "Profile not found or not logged in"; exit 1; fi
aptos move run --profile "$PROFILE" --function-id "${ADDR}::governance::initialize_dao" \
  --args string:"$NAME" u64:"$VOTING_PERIOD" u64:"$TIMELOCK" u64:"$QUORUM" u64:"$PROPOSAL_THRESHOLD" u8:"$STRATEGY" bool:"$VETO_ENABLED" address:"$VETO_AUTH"
