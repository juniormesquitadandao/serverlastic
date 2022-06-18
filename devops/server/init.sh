#!/bin/sh

set -e

alias http-server="${PWD}/node_modules/http-server/bin/http-server"

cp -R 'tests/server' '/tmp/'

cd '/tmp/server'

  http-server -a 127.0.0.1 --port $([ "${NODE_ENV}" = 'test' ] && echo '80' || echo '9000')
