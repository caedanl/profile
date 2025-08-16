.PHONY: dev prod stop build clean logs format format-check help

# Development environment
dev:
	docker compose --profile dev up -d

dev-build:
	docker compose --profile dev up -d --build

# Production environment  
prod:
	docker compose --profile prod up -d

prod-build:
	docker compose --profile prod up -d --build

# Stop services
stop:
	docker compose down

# Build commands
build:
	docker compose build

# View logs
dev-log:
	docker compose --profile dev logs -f

prod-log:
	docker compose --profile prod logs -f

# Cleanup
clean:
	docker compose down -v
	docker rmi profile-web-dev profile-web-prod 2>/dev/null || true