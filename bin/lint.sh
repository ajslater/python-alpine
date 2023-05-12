#!/bin/bash
# Lint checks
set -euxo pipefail

############################################
##### Javascript, JSON, Markdown, YAML #####
############################################
npm run lint
npm run remark-check

################################
###### Docker, Shell, Etc ######
################################
if [ "$(uname)" = "Darwin" ]; then
    # Hadolint & shfmt are difficult to install on linux
    # shellcheck disable=2035
    hadolint *Dockerfile
    shellharden ./**/*.sh
    # subdirs aren't copied into docker builder
    # .env files aren't copied into docker
    shellcheck --external-sources ./**/*.sh
    # circleci config check .circleci/config.yml
fi
./bin/roman.sh -i .gitignore .
