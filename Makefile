SRC_FILES = $(shell find docker -type f)
IMAGE_NAME ?= whisper
IMAGE_TAG = 0.0.1
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)
CONTAINER_NAME = whisper
PWD ?= $(error PWD is not set)
PREFIX = $(PWD)/bin

.PHONY: build
build: .make.build

.make.build: $(SRC_FILES)
	@docker build -f docker/Dockerfile -t $(IMAGE) -t $(IMAGE_NAME):latest .
	@touch $@

.PHONY: install
install: build
	@bash -c 'if [[ ! -d $(PREFIX) ]]; then mkdir $(PREFIX); fi'
	@echo '#!/usr/bin/env bash' > $(PREFIX)/whisper
	@echo 'set -e' >> $(PREFIX)/whisper
	@echo exec vessel run --rm --name $(CONTAINER_NAME) -it $(IMAGE) >> $(PREFIX)/whisper
	@chmod +x $(PREFIX)/whisper

.PHONY: push
push: build
	@docker push $(IMAGE_NAME):latest
