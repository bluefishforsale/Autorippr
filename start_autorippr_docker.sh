#!/usr/bin/env bash

SERVICE="autorippr"
IMAGE="autorippr"
VERSION="latest"
LOCALDIR="/data01/services/${SERVICE}"
RIP="/data01/incoming/discs"
TV="/data01/incoming/complete/tv"
MOVIES="/data01/incoming/complete/movies"

docker stop ${SERVICE}
docker rm ${SERVICE}


sudo docker run -d \
    --restart=always \
    --name=${SERVICE} \
    --hostname=${HOSTNAME} \
    -e PUID=1001 -e PGID=100 \
    -v ${LOCALDIR}:/config \
    -v ${RIP}:/tmp \
    -v ${TV}:/tmp/tvshows \
    -v ${MOVIES}:/tmp/movies \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
