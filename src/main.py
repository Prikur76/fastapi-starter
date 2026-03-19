from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .api.v1 import health
from .core.config import settings

app = FastAPI(
    title=settings.APP_NAME,
    description="Project description",
    version="0.1.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health.router, prefix="/api/v1", tags=["health"])