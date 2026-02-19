.PHONY: lint test build docker-push

IMAGE_NAME=student-api

lint:
	python -m flake8 app tests

test:
	pytest

build:
	docker build -t $(IMAGE_NAME):latest .

docker-push:
	docker tag $(IMAGE_NAME):latest $(DOCKER_USERNAME)/$(IMAGE_NAME):latest
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):latest
