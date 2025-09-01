#!/usr/bin/env bash
set -euo pipefail
PROFILE=${1:-mainnet}
ADDR=$(aptos config show-profiles --profile "$PROFILE" | awk '/Account/{print $2}')
if [ -z "$ADDR" ]; then echo "Profile $PROFILE not configured. Run 'aptos init --profile $PROFILE'"; exit 1; fi
aptos move publish --profile "$PROFILE" --named-addresses addr=$ADDR
