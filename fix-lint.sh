#!/bin/bash
# Fix common linting errors
set -euxo pipefail
shellharden --replace ./*.sh ./usr/local/sbin/*.sh
