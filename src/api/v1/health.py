import logging

from fastapi import APIRouter, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session

from ...db.session import get_db

logger = logging.getLogger(__name__)

router = APIRouter()


@router.get("/health")
async def health_check(db: Session = Depends(get_db)):
    try:
        db.execute(text("SELECT 1"))
        db_status = "healthy"
    except Exception:
        logger.exception("Database health check failed")
        db_status = "unhealthy"

    return {
        "status": "healthy",
        "database": db_status,
        "service": "{{ project_name }}",
    }
