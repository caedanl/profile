.PHONY: dev prod stop build clean logs format format-check help init

# Initialize project
init:
	@if [ ! -f .env ]; then \
		cp .env.template .env; \
		echo "Created .env file from template"; \
		echo ""; \
		echo "Next steps:"; \
		echo "   1. Edit .env file to set your preferred PORT"; \
		echo "   2. Run 'make dev' to start development environment"; \
		echo "   3. Run 'make prod' to start production environment"; \
	else \
		echo ".env file already exists"; \
	fi

# Development environment
dev:
	ENVIRONMENT=dev docker compose up -d

dev-build:
	ENVIRONMENT=dev docker compose up -d --build

# Production environment  
prod:
	ENVIRONMENT=prod docker compose up -d

prod-build:
	ENVIRONMENT=prod docker compose up -d --build

# Stop services
stop:
	docker compose down

# Build commands
build:
	docker compose build

# View logs
dev-log:
	docker logs profile-dev 2>/dev/null || echo "Dev container not running"

prod-log:
	docker logs profile-prod 2>/dev/null || echo "Prod container not running"

# Cleanup
clean:
	docker compose down -v
	docker rmi profile-web-dev profile-web-prod 2>/dev/null || true