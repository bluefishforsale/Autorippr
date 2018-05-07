#!/usr/bin/env bash

SERVICE="autorippr"
IMAGE="autorippr"
VERSION="latest"
LOCALDIR="/data01/services/${SERVICE}"
RIP="/M2scratch/autorippr"
TV="/data01/complete/tv"
MOVIES="/data01/complete/movies"

DRIVE=$(ls -1 /dev/sr* | head)

docker stop ${SERVICE}
docker rm ${SERVICE}

sudo docker run -d \
    --cpus=2 \
    --restart=always \
    --name=${SERVICE} \
    --hostname=${HOSTNAME} \
    --device=/dev/sr0:/dev/sr0:r \
    --device=/dev/sg0:/dev/sg0:r \
    --cap-add=SYS_RAWIO \
    -e PUID=1001 -e PGID=1001 \
    -v ${RIP}:/tmp/rip \
    -v ${TV}:/tv \
    -v ${MOVIES}:/movies \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
