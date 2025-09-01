#!/usr/bin/env bash
set -euo pipefail
PROFILE=${1:-default}
aptos move publish --profile "$PROFILE"
