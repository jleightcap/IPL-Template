#!/bin/sh

# docker run -dt latex
DOCK="$(docker ps | grep "latex" |  awk '{ print $1 }')"

if [ -z "${DOCK}" ]; then
    echo "starting detatched latex container..."
    docker-machine ssh docker1 "mkdir -p /tmp/latex"
    docker run -dt --mount src=/tmp/latex,target=/data,type=bind --name latex-test latex
fi

docker-machine scp -r -d -q -- * docker1:/tmp/latex

docker exec "$DOCK" latexmk "$@"
docker-machine scp -r -d -q docker1:/tmp/latex/ .
docker exec "$DOCK" rm -r -- *
