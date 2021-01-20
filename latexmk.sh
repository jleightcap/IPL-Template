#!/usr/local/bin/bash

# docker run -dt latex
DOCK="$(docker ps | grep "latex" |  awk '{ print $1 }')"

if [ -z "${DOCK}" ]; then
    echo "starting detatched latex container..."
    docker-machine ssh docker1 "mkdir -p /tmp/latex"
    docker run -dt --mount src=/tmp/latex,target=/data,type=bind --name latex-test latex
fi

# need to copy over whole envionment (standalone, images, etc.)
docker-machine scp -r -d -q -- . docker1:/tmp/latex
# pass on command
docker exec "$DOCK" latexmk "$@"
# but only copy back the resulting PDF
docker-machine scp -r -d -q docker1:/tmp/latex/"$(basename "${*: -1}" .tex)".pdf .
# tidy up
docker exec "$DOCK" rm -r -- *
