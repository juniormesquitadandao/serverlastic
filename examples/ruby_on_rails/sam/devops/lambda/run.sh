#!/bin/sh

set -e

docker run --rm -it \
  --user 'user' \
  --volume "${PWD}/sam:/home/user/serverlastic/sam" \
  --add-host 'dockerhost:host-gateway' \
  --entrypoint '' \
  serverlasticfunction:latest $*
