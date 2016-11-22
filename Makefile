
NAME = davidgasquez/dopyter:latest

.PHONY: all build run

all: run

build:
	docker build -t $(NAME) .

run:
	docker run -p 8888:8888 -v $(PWD):/work -it --rm $(NAME)

bash:
	docker run -i -t -p 8888:8888 --rm $(NAME) bash
