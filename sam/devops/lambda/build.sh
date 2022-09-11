#!/bin/sh

set -e

sam build --template 'sam/template.yaml' \
  --build-dir 'sam/.aws-sam/build'
