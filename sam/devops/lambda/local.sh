#!/bin/sh

set -e

sam local start-api --host '0.0.0.0' --warm-containers 'LAZY' --template 'sam/.aws-sam/build/template.yaml'
