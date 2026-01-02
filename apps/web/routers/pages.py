from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path

from lib.greeting import greeting
from models.users import in_memory_users

router = APIRouter()

BASE_DIR = Path(__file__).resolve().parent.parent
templates = Jinja2Templates(directory=BASE_DIR / "templates")

@router.get(
    "/",
    response_class=HTMLResponse,
)
def index(
    request: Request,
    name: str = "anonymous"
) -> HTMLResponse:
    message = greeting(name)
    return templates.TemplateResponse(
        "pages/index.html",
        { "request": request, "message": message }
    )

@router.get(
    "/users",
    response_class=HTMLResponse,
)
def users(
    request: Request,
) -> HTMLResponse:
    return templates.TemplateResponse(
        "partials/list_users.html",
        { "request": request, "users": in_memory_users }
    )
