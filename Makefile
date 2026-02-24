.PHONY: lint test build up down logs clean docker-push deploy

# -----------------------------
# Variables
# -----------------------------
IMAGE_NAME=student-api
TAG=latest
DOCKER_USERNAME?=your-dockerhub-username
COMPOSE=docker-compose

# -----------------------------
# Code Quality
# -----------------------------
lint:
	@echo "Running lint checks..."
	python -m flake8 app tests

test:
	@echo "Running unit tests..."
	pytest

# -----------------------------
# Docker Build
# -----------------------------
build:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME):$(TAG) .

# -----------------------------
# Docker Compose (Local Dev)
# -----------------------------
up:
	@echo "Starting services using Docker Compose..."
	$(COMPOSE) up -d --build

down:
	@echo "Stopping services..."
	$(COMPOSE) down

logs:
	@echo "Viewing logs..."
	$(COMPOSE) logs -f

clean:
	@echo "Removing unused Docker resources..."
	docker system prune -f

# -----------------------------
# Docker Push (CI/CD)
# -----------------------------
docker-push:
	@echo "Pushing image to DockerHub..."
	docker tag $(IMAGE_NAME):$(TAG) $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)

# -----------------------------
# Production Deployment
# -----------------------------
deploy: build up
	@echo "Application deployed successfully."