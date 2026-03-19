.PHONY: help install-dev install test lint format clean docker-up docker-down db-init db-migrate db-upgrade db-downgrade

help:
	@echo "Cписок доступных команд:"
	@echo "  install-dev    Install development dependencies"
	@echo "  install        Install production dependencies"
	@echo "  test           Run tests"
	@echo "  lint           Run linters"
	@echo "  format         Format code"
	@echo "  clean          Clean temporary files"
	@echo "  docker-up      Start docker containers"
	@echo "  docker-down    Stop docker containers"
	@echo "  db-init        Initialize database"
	@echo "  db-migrate     Create new migration"
	@echo "  db-upgrade     Apply migrations"
	@echo "  db-downgrade   Rollback migrations"

install-dev:
	uv pip install -e ".[dev]"
	pre-commit install

install:
	uv pip install -e .

test:
	pytest tests/ -v --cov=src

lint:
	ruff check src/ tests/
	black --check src/ tests/

format:
	ruff check --fix src/ tests/
	black src/ tests/

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".coverage" -delete
	find . -type d -name "htmlcov" -exec rm -rf {} +

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

db-init:
	alembic init alembic

db-migrate:
	alembic revision --autogenerate -m "$(m)"

db-upgrade:
	alembic upgrade head

db-downgrade:
	alembic downgrade -1
