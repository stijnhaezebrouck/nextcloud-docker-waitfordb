#!/bin/sh

echo "Waiting for database on $DB_HOST:$DB_PORT..."

while ! nc -z $DB_HOST $DB_PORT > /dev/null 2>&1; do
  sleep 0.1 # wait for 1/10 of the second before check again
done


echo "Database is available"

$1
