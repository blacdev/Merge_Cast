.PHONY:

message ?= "update database"

# Usage message
help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  upgrade      - Upgrade the database"
	@echo "  downgrade    - Downgrade the database"
	@echo "  run          - Start the service"
	@echo "  test         - Run tests"
	@echo "  commit       - Perform a Git commit"
	@echo "  fmt          - Format the code with Black"

upgrade:
	alembic revision --autogenerate -m $(message)
	alembic upgrade head

downgrade:
	alembic downgrade -1

run:
	python3 main.py

test:
	pytest

commit:
	git add .
	git commit

fmt:
	python3 -m black .

# pre-commit:
# 	@echo "Checking if 'pre-commit' is installed..."
# 	@which pre-commit > /dev/null || pip3 install pre-commit
# 	pre-commit install --hook-type pre-commit
# 	pre-commit install --hook-type commit-msg
# 	pre-commit run --all-files
