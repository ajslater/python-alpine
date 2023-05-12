#!/bin/bash
# Update python and npm dependencies
set -euo pipefail
npm update
npm outdated
