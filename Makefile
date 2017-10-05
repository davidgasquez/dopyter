
IMAGE_NAME := davidgasquez/dopyter:latest

.DEFAULT_GOAL := run

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: run
run:
	docker run -it -p 8888:8888 --rm $(IMAGE_NAME)

.PHONY: push
push:
	docker push davidgasquez/dopyter:latest

.PHONY: dev
dev:
	docker run -it -p 8888:8888 -v $(PWD):/work --rm $(IMAGE_NAME) bash
