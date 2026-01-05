# FastAPI + HTMX template

FastAPI + Jinja2 + HTMX の最小構成テンプレートです。`uv` のワークスペース構成で `apps/web` と `packages/shared` を管理します。

## 必要要件
- Python 3.12+
- uv
- （任意）Docker

## セットアップ
```bash
uv sync
```

## 起動（開発）
```bash
make run
# 直接実行する場合:
# uv run --package web uvicorn main:app --app-dir apps/web --reload
```

ブラウザで `http://127.0.0.1:8000` を開いてください。

## Notebook（カーネル登録）
```bash
make notebook-init
# 直接実行する場合:
# uv run python -m ipykernel install --user --name repo --display-name "Python (repo)"
```

## Notebook（起動）
```bash
uv run jupyter lab --notebook-dir notebooks
```

## エンドポイント
- `GET /` : HTML（Jinja2）
- `GET /users` : HTMX 用パーシャル
- `GET /api` : JSON（挨拶）
- `GET /api/users` : JSON（ユーザー一覧）

## ディレクトリ構成
- `apps/web` : FastAPI 本体（ルーティング・テンプレート）
- `packages/shared` : 共有ロジック（モデル・ヘルパー）

## 依存関係の追加
```bash
uv add --package web <library>
uv add --package shared <library>
```

## Docker
```bash
make build
docker run --rm -p 8000:80 fastapi-htmx-sample-app
```
