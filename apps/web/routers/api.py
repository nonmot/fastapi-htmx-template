from fastapi import APIRouter
from fastapi.responses import JSONResponse

from lib.greeting import greeting
from models.users import User, in_memory_users


router = APIRouter()

@router.get(
    "/",
    response_class=JSONResponse
)
def index(
    name: str = "anonymous"
):
    message = greeting(name)
    return JSONResponse({"message": message})

@router.get(
    "/users",
    response_model=list[User],
)
def users() -> list[User]:
    return in_memory_users
