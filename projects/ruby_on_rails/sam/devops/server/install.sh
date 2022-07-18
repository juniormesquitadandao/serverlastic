#!/bin/sh

set -e

bundle install

npm install

RAILS_ENV=production \
  NODE_ENV=production \
  rails assets:precompile
