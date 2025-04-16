FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim AS base

WORKDIR /app

FROM base as builder

COPY pyproject.toml uv.lock /app/

RUN uv sync --frozen

FROM base as production

ARG PORT=8050
ENV PORT=${PORT}

RUN useradd -m -s /bin/bash appuser

COPY --from=builder /app/.venv /app/.venv
COPY . .

ENV PATH="/app/.venv/bin:$PATH"

ENTRYPOINT []

EXPOSE ${PORT}

CMD ["uv", "run", "src/main.py"]
