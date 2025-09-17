SRC_FILES = $(shell find docker -type f)
IMAGE_NAME ?= caddy
IMAGE_TAG = 0.0.1
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)
TIME_TAG = $(shell date '+%Y%m%d-%H%M%S')
CONTAINER_NAME = caddy
PWD ?= $(error PWD is not set)
PREFIX = $(PWD)/bin
DOCKER_ENGINE ?= docker

.PHONY: build
build: .make.build

.make.build: $(SRC_FILES)
	@$(DOCKER_ENGINE) build -f docker/Dockerfile -t $(IMAGE) -t $(IMAGE_NAME):latest -t $(IMAGE_NAME):$(TIME_TAG) .
	@touch $@

.PHONY: install
install: build
	@bash -c 'if [[ ! -d $(PREFIX) ]]; then mkdir $(PREFIX); fi'
	@echo '#!/usr/bin/env bash' > $(PREFIX)/caddy
	@echo 'set -e' >> $(PREFIX)/caddy
	@echo exec $(DOCKER_ENGINE) run --rm --name $(CONTAINER_NAME) -it $(IMAGE_NAME) >> $(PREFIX)/caddy
	@chmod +x $(PREFIX)/caddy

.PHONY: push
push: build
	$(DOCKER_ENGINE) push $(IMAGE_NAME):latest
	$(DOCKER_ENGINE) push $(IMAGE_NAME):$(TIME_TAG)
	$(DOCKER_ENGINE) push $(IMAGE)

.PHONY: run
run: build
	@$(DOCKER_ENGINE) run --rm --name $(CONTAINER_NAME) -it $(IMAGE_NAME)
