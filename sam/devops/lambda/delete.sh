#!/bin/sh

set -e

aws cloudformation delete-stack --stack-name YOUR_PROJECT_DASH-function-stack
