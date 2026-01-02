FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

ARG APP_UID=10001
ARG APP_GID=10001

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY pyproject.toml uv.lock /app/
COPY apps /app/apps
COPY packages /app/packages

RUN groupadd -g ${APP_GID} app \
    && useradd -u ${APP_UID} -g app -d /app -s /usr/sbin/nologin -M app \
    && uv sync --frozen --no-cache \
    && chown -R app:app /app

USER app

CMD ["uv", "run", "--package", "web", "uvicorn", "main:app", "--app-dir", "apps/web", "--port", "80", "--host", "0.0.0.0"]
