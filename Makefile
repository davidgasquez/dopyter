IMAGE_NAME := davidgasquez/dopyter:2.0.0

.DEFAULT_GOAL := run

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: build
build-clean:
	docker build --no-cache -t $(IMAGE_NAME) .

.PHONY: run
run: build
	docker run -it -p 8888:8888 --rm $(IMAGE_NAME)

.PHONY: push
push:
	docker push $(IMAGE_NAME)

.PHONY: dev
dev: build
	docker run -it -p 8888:8888 -v $(PWD):/work --rm $(IMAGE_NAME) bash
