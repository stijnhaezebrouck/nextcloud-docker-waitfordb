# nextcloud-docker-waitfordb
A nextcloud docker image for nextcloud, based on the wonderfall image, but waiting for the db to come up (using netcat)
This image is based on the [wonderfall/nextcloud:latest](https://hub.docker.com/r/wonderfall/nextcloud/) image.

Its adds the following:
* environment variable $DB_PORT
* When the container is run, it wait forever for the database to come up, by attempting to create a tcp connection on $DB_HOST:$DB_PORT
* For that, it uses the script wait-for-db.sh

So to use this, use the environment variables from [wonderfall/nextcloud](https://hub.docker.com/r/wonderfall/nextcloud/), and add $DB_PORT.
Then, you can specify it in a docker-compose.yml file, together with a mariadb image. Wonderfall instructs you to first start the database,
then wait 15 secons, and then start nextcloud. With this image, you can directly start nextcloud and the database image. The database will
start and initialise, but will not be accepting connections yet, when the nextcloud is started. Therfore, when using this image, the 
start script for nextcloud will wait for the ability to create a connection to the database first, before continuing startup.
This is the only thing that this image adds to the wonderfall image.
