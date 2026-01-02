.PHONY = run build

IMAGE_NAME = fastapi-htmx-sample-app

run:
	uv run --package web uvicorn main:app --app-dir apps/web --reload

build:
	docker build \
		-t $(IMAGE_NAME) \
		.
