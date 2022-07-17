#!/bin/sh

set -e

./sam/devops/lambda/run.sh siege --concurrent $1 --delay 0s --time 10s --verbose --benchmark $2
