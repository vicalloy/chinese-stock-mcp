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
	python -m china_stock_mcp.server --transport http

.PHONY: build
build:
	uv build

.PHONY: build
publish:
	uv publish
