FROM python:{{ python_version }}-slim as builder

WORKDIR /app

RUN pip install uv

COPY pyproject.toml uv.lock ./
RUN uv pip install --system --no-cache -r pyproject.toml

COPY . .

FROM python:{{ python_version }}-slim

WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*

# Copy installed packages from builder
COPY --from=builder /usr/local/lib/python{{ python_version.split('.')[0] }}.{{ python_version.split('.')[1] }}/site-packages /usr/local/lib/python{{ python_version.split('.')[0] }}.{{ python_version.split('.')[1] }}/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy application code
COPY ./src /app/src
COPY alembic.ini /app/
COPY alembic /app/alembic

# Create non-root user
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
