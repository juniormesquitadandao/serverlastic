#!/bin/sh

set -e

aws cloudformation delete-stack --stack-name node-http-server-function-stack
