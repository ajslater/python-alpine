#!/bin/bash
set -xeuo pipefail
source .env

export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
docker buildx create --use
# shellcheck disable=SC2086
docker buildx build \
    --platform "$PLATFORMS" \
    --build-arg BASE_VERSION="$BASE_VERSION" \
    --build-arg VERSION="$VERSION" \
    --tag "$REPO:${VERSION}" \
    --tag "$REPO:latest" \
    "${PUSH:-}" \
    .
