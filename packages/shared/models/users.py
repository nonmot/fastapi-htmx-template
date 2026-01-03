from pydantic import BaseModel


class User(BaseModel):
    id: int
    name: str
    email: str


in_memory_users: list[User] = [
    User(
        id=1,
        name="John Doe",
        email="johndoe@example.com",
    ),
    User(
        id=2,
        name="Admin",
        email="admin@example.com",
    ),
]
