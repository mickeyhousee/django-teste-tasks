#!/bin/sh
set -e

echo "Applying migrations"
python src/manage.py migrate

echo "Collecting static files"
python src/manage.py collectstatic --noinput
