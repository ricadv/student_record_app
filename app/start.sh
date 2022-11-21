#!/bin/bash

set -ex

sed -i "s|___MYSQL_HOST___|${MYSQL_HOST}|" /app/src/backend.conf
sed -i "s|___MYSQL_PORT___|${MYSQL_PORT}|" /app/src/backend.conf
sed -i "s|___MYSQL_DB___|${MYSQL_DB}|" /app/src/backend.conf
sed -i "s|___MYSQL_USER___|${MYSQL_USER}|" /app/src/backend.conf
sed -i "s|___MYSQL_PASSWORD___|${MYSQL_PASSWORD}|" /app/src/backend.conf

/app/src/wait-for-it.sh ${MYSQL_HOST}:${MYSQL_PORT}

exec /app/.local/bin/gunicorn wsgi:app -b 0.0.0.0:8000

curl -X POST http://backend/add
     -H 'Content-Type: application/json'
     -d '{"student_id":"A12345678","student_name":"Tina"}
