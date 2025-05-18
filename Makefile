SRC_FILES = $(shell find docker -type f)
IMAGE_NAME = whisper:0.0.1
CONTAINER_NAME = whisper
PWD ?= $(error PWD is not set)
PREFIX = $(PWD)/bin

.PHONY: build
build: docker/.make.build

docker/.make.build: $(SRC_FILES)
	@vessel build -f docker/Dockerfile -t $(IMAGE_NAME) .
	@touch $@

.PHONY: install
install: build
	@bash -c 'if [[ ! -d $(PREFIX) ]]; then mkdir $(PREFIX); fi'
	@echo '#!/usr/bin/env bash' > $(PREFIX)/whisper
	@echo 'set -e' >> $(PREFIX)/whisper
	@echo exec vessel run --rm --name $(CONTAINER_NAME) -it $(IMAGE_NAME) >> $(PREFIX)/whisper
	@chmod +x $(PREFIX)/whisper
