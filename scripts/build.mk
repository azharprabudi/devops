.PHONY: build-nodejs
build-nodejs:
	rm -rf ./node_modules
	npm ci
	docker build -f Dockerfile -t ${SERVICE_NAME}:${GIT_COMMIT_SHORT_HASH} . 
