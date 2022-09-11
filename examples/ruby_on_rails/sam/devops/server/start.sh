#!/bin/sh

set -e

cd ../

  if [ "${NODE_ENV}" = 'test' ]; then
    PORT=80
  else
    PORT=9000
  fi

  RAILS_ENV=production \
    NODE_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true \
    RAILS_MAX_THREADS=1 \
    PIDFILE='/tmp/server.pid' \
    rails s --binding '127.0.0.1' --port $PORT
