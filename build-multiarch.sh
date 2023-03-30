#!/bin/bash
set -xeuo pipefail
source .env

export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
docker buildx create --use

BUILD_ARGS=(
    --platform "$PLATFORMS"
    --build-arg BASE_VERSION="$BASE_VERSION"
    --build-arg VERSION="$VERSION"
    --tag "$REPO:${VERSION}"
    --tag "$REPO:latest"
)
if [ "${1-}" == 'push' ]; then
    BUILD_ARGS+=(--push)
fi

docker buildx build "${BUILD_ARGS[@]-}" .
