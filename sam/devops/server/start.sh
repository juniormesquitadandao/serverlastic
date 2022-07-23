#!/bin/sh

set -e

cd /tmp/serverlastic

  if [ "${NODE_ENV}" = 'test' ]; then
    PORT=80
  else
    PORT=9000
  fi

  node_modules/http-server/bin/http-server app -a 127.0.0.1 --port $PORT
