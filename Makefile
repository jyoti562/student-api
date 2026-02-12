# Start database only
db-up:
	docker-compose up -d db

# Stop everything
down:
	docker-compose down

# Run migrations
migrate:
	docker-compose run --rm api flask db upgrade

# Start full application (DB + API)
up: db-up
	@echo "Waiting for DB to be ready..."
	powershell -Command "Start-Sleep 5"
	make migrate
	make build
	docker-compose up -d api

# View logs
logs:
	docker-compose logs -f
