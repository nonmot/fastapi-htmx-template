.PHONY: run notebook-init build

IMAGE_NAME = fastapi-htmx-sample-app

run:
	uv run --package web uvicorn main:app --app-dir apps/web --reload

notebook-init:
	uv sync --group notebooks
	uv run python -m ipykernel install --user --name repo --display-name "Python (repo)"

build:
	docker build \
		-t $(IMAGE_NAME) \
		.
