SERVICE_NAME:="sample-nodejs-app"

.PHONY: build
build:
	${MAKE} build-nodejs GIT_COMMIT_SHORT_HASH=$(shell git log --pretty=format:'%h' -n 1)

include ../../scripts/build.mk
