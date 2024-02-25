#!/bin/sh
set -eu
cd "$( dirname "$0" )"

docker logs hello-nginx-1

echo

docker exec -i hello-nginx-1 sh <<EOF
ps -ef
EOF

echo

curl localhost:8080
