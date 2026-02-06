IMAGE_NAME=student-api
IMAGE_TAG=1.1.1
CONTAINER_NAME=student-api
PORT=5000

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	
run: stop
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):$(PORT) \
		-e PORT=$(PORT) \
		-e DEBUG=false \
		$(IMAGE_NAME):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

logs:
	docker logs -f $(CONTAINER_NAME)
