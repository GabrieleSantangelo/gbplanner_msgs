CONTAINER_IMAGE := gbplanner3_msgs:jazzy
CONTAINER_NAME := gbplanner3_msgs
PERCENT := %
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

default: run


build: ## Build release container
	@echo "Building $(CONTAINER_IMAGE) container image..."
	@docker build \
		--tag $(CONTAINER_IMAGE) \
		--file docker/Dockerfile \
		.
		
run-dev: ## Run a disposable development container
	@docker run \
		--interactive \
		--tty \
		--rm \
		--runtime nvidia \
		--gpus all \
		--privileged \
		--net host \
		--ipc host \
		--name ${CONTAINER_NAME}-dev \
		--volume $(ROOT_DIR):/workspace/src/gbplanner3_msgs \
		$(CONTAINER_IMAGE) \
		bash 

clean: ## Clean image artifacts
	-docker rmi $(CONTAINER_IMAGE)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "%-10s %s\n", $$1, $$2}'

.PHONY: default run run-dev build clean help