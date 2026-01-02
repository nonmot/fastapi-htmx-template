FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the application into the container.
COPY . /app

# Install the application dependencies.
WORKDIR /app
RUN uv sync --frozen --no-cache

CMD ["uv", "run", "--package", "web", "uvicorn", "main:app", "--app-dir", "apps/web", "--port", "80", "--host", "0.0.0.0"]
