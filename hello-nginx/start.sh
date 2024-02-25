#!/bin/sh
set -eu
cd "$( dirname "$0" )"

docker run \
    --rm \
    --name "hello-nginx-1" \
    -d \
    -p "8080:80" \
    "hello-nginx:0.0.1"
