FROM python:3.12-slim

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src

EXPOSE 8000

CMD ["bash", "-c", "python src/manage.py migrate && python src/manage.py collectstatic --noinput && gunicorn core.wsgi:application --bind 0.0.0.0:8000 --chdir /app/src"]

