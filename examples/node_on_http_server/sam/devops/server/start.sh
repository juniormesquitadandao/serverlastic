#!/bin/sh

set -e

cd ../

  if [ "${NODE_ENV}" = 'test' ]; then
    PORT=80
  else
    PORT=9000
  fi

  node_modules/http-server/bin/http-server public -a '127.0.0.1' --port $PORT
