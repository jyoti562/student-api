.PHONY: test lint build docker-push

test:
	pytest

lint:
	python -m flake8 app tests

build:
	docker build -t student-api .

docker-push:
	docker tag student-api $(DOCKER_USERNAME)/student-api:latest
	docker push $(DOCKER_USERNAME)/student-api:latest
