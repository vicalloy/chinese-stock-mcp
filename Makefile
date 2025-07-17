init-pre-commit:
	pre-commit install
	pre-commit run --all-files

update-pre-commit:
	pre-commit autoupdate

.PHONY: shell
shell:
	@echo "copy and paste the following command to activate the virtual environment"
	@echo "source .venv/bin/activate"

init-venv:
	uv sync
	make shell

run:
	python -m chinese_stock_mcp.server --transport http --token "$(XQ_TOKEN)"

.PHONY: build
build:
	rm -rf dist/*
	uv build

.PHONY: build
publish: build
	uv publish
