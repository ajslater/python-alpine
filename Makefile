.PHONY: install
## Install for production
## @category Install
install:
	npm install

.PHONY: update
## Update dependencies
## @category Update
update:
	./bin/update-deps.sh

## Show version. Use V variable to set version
## @category Update
V :=
.PHONY: version
## Show or set project version
## @category Update
version:
	bin/version.sh $(V)

.PHONY: kill-eslint_d
## Kill eslint daemon
## @category Lint
kill-eslint_d:
	bin/kill-eslint_d.sh

.PHONY: fix
## Fix front and back end lint errors
## @category Lint
fix:
	./bin/fix-lint.sh

.PHONY: lint
## Lint front and back end
## @category Lint
lint: 
	./bin/lint.sh

.PHONY: news
## Show recent NEWS
## @category Deploy
news:
	head -40 NEWS.md

.PHONY: all
.PHONY: test
.PHONY: clean

include bin/makefile-help.mk
