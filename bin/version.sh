#!/bin/bash
# Get version or set version in Frontend & API.
set -euo pipefail
VERSION="${1:-}"
if [ "$VERSION" = "" ]; then
  source .env
  echo "$VERSION"
else
  echo Edit .env by hand.
fi
