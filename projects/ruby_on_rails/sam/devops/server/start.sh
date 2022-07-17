#!/bin/sh

set -e

TMP_DIR=/tmp/serverlastic

if ! test -d $TMP_DIR; then
  unzip -q /home/user/serverlastic.zip -d /tmp

  cd $TMP_DIR

    if [ "${NODE_ENV}" = 'test' ]; then
      PORT=80
    else
      PORT=9000
    fi

    RAILS_ENV=production \
      RAILS_MAX_THREADS=1 \
      RAILS_SERVE_STATIC_FILES=true \
      rails s -b '127.0.0.1' --port $PORT
fi
