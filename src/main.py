from fastapi import FastAPI

from .api.v1 import health
from .core.config import settings


app = FastAPI(
    title="FastAPI Project",
    description="Project description",
    version="0.1.0",
)

# Include routers
app.include_router(health.router, prefix="/api/v1", tags=["health"])
