IMAGE_NAME := davidgasquez/dopyter
IMAGE_VERSION := 2.5.0

.DEFAULT_GOAL := run

.PHONY: build
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) -t $(IMAGE_NAME):latest .

.PHONY: build
build-clean:
	docker build --no-cache -t $(IMAGE_NAME):$(IMAGE_VERSION) -t $(IMAGE_NAME):latest .

.PHONY: run
run: build
	docker run -it -p 8888:8888 --rm $(IMAGE_NAME):$(IMAGE_VERSION)

.PHONY: push
push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):latest

.PHONY: dev
dev: build
	docker run -it -p 8888:8888 -v $(PWD):/work --rm $(IMAGE_NAME):$(IMAGE_VERSION) bash
