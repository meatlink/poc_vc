#!/bin/sh
set -eu
cd "$( dirname "$0" )"

cd nginx-hello-world
docker build -t hello-nginx:0.0.1 .
