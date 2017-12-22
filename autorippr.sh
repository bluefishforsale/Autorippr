#!/usr/bin/env bash

SERVICE="autorippr"
IMAGE="autorippr"
VERSION="latest"
LOCALDIR="/data01/services/${SERVICE}"
RIP="/M2scratch/autorippr"
TV="/data01/complete/tv"
MOVIES="/data01/complete/movies"

docker stop ${SERVICE}
docker rm ${SERVICE}

sudo docker run -d \
    --cpus=4 \
    --restart=always \
    --name=${SERVICE} \
    --hostname=${HOSTNAME} \
    --device=/dev/sr0:/dev/sr0:r \
    -e PUID=1001 -e PGID=1001 \
    -v ${LOCALDIR}:/config \
    -v ${RIP}:/tmp/rip \
    -v ${TV}:/tv \
    -v ${MOVIES}:/movies \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
