FROM python:3.12-slim

WORKDIR /app

# Install PostgreSQL client libraries
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY pyproject.toml ./
RUN pip install .


COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY src ./src

EXPOSE 8000

CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000", "--chdir", "/app/src"]

