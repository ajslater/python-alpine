#!/bin/bash
# Run binfmt install to use docker buildx commands
set -euxo pipefail
source .env
export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
docker run --rm --privileged tonistiigi/binfmt:latest --install "$PLATFORMS"
