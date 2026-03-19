"""Smoke tests for the HTTP API."""

from collections.abc import Generator
from typing import Any

import pytest
from fastapi.testclient import TestClient

from src.db.session import get_db
from src.main import app


class _FakeDb:
    """Minimal session stand-in for the health endpoint."""

    def execute(self, *_args: Any, **_kwargs: Any) -> None:
        return None

    def close(self) -> None:
        pass


def _override_get_db() -> Generator[Any, None, None]:
    yield _FakeDb()


@pytest.fixture
def client() -> Generator[TestClient, None, None]:
    app.dependency_overrides[get_db] = _override_get_db
    with TestClient(app) as test_client:
        yield test_client
    app.dependency_overrides.clear()


def test_health_ok(client: TestClient) -> None:
    response = client.get("/api/v1/health")
    assert response.status_code == 200
    body = response.json()
    assert body["status"] == "healthy"
    assert body["database"] == "healthy"
