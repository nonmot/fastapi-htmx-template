from fastapi import FastAPI
from routers import pages, api

app = FastAPI()

app.include_router(pages.router, tags=["pages"])
app.include_router(api.router, prefix="/api", tags=["api"])
