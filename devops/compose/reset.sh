#!/bin/sh

set -e

docker compose down &&

docker volume rm serverlastic_app_local || true &&

docker compose build
