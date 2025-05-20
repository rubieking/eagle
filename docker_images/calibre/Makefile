SRC_FILES = $(shell find docker -type f)
IMAGE_NAME ?= calibre
IMAGE_TAG = 0.0.1
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)
CONTAINER_NAME = calibre
PWD ?= $(error PWD is not set)
PREFIX = $(PWD)/bin
DOCKER ?= docker

.PHONY: build
build: .make.build

.make.build: $(SRC_FILES)
	@$(DOCKER) build -f docker/Dockerfile -t $(IMAGE_NAME) .
	@touch $@

.PHONY: install
install: build
	@bash -c 'if [[ ! -d $(PREFIX) ]]; then mkdir $(PREFIX); fi'
	@echo '#!/usr/bin/env bash' > $(PREFIX)/calibre
	@echo 'set -e' >> $(PREFIX)/calibre
	@echo exec $(DOCKER) run --rm --name $(CONTAINER_NAME) -it $(IMAGE) >> $(PREFIX)/calibre
	@chmod +x $(PREFIX)/calibre

.PHONY: push
push: build
	@$(DOCKER) push $(IMAGE):latest

.PHONY: run
run: build
	@$(DOCKER) run --rm --name $(CONTAINER_NAME) -it $(IMAGE_NAME)
