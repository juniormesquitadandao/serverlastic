#!/bin/sh

set -e

docker compose exec app sam build
