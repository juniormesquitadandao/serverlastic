#!/bin/sh

set -e

aws cloudformation delete-stack --stack-name ruby-on-rails-function-stack
