#!/bin/sh

set -e

docker compose exec app siege --concurrent $1 --delay 0s --time 10s --verbose --benchmark $2
