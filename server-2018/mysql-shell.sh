#!/bin/bash
set -e

cmd=(sh -c 'exec mysql -h uka-database -u root -p"$MYSQL_ROOT_PASSWORD"')
if [ $# -gt 0 ]; then
  cmd=("$@")
fi

exec docker run \
  --rm \
  -it \
  --network uka \
  -u $(id -u):$(id -g) \
  -v /home/core/:/data \
  -w /data \
  --env-file database-secrets.env \
  mysql:5.6 \
  "${cmd[@]}"
