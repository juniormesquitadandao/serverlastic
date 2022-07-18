#!/bin/sh

set -e

cd /tmp/serverlastic

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
    rails s -b '127.0.0.1' --port $PORT
