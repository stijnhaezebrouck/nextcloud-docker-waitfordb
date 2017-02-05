#!/bin/sh

echo "Waiting for mysql..."

while ! nc -z nextcloud-db 3306 > /dev/null 2>&1; do
  sleep 0.1 # wait for 1/10 of the second before check again
done


echo "Mysql was started"
