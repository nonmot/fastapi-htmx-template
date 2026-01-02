.PHONY = run

run:
	uv run --package web uvicorn main:app --app-dir apps/web --reload
