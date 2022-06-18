#!/bin/sh

set -e

rm -rf .aws-sam/deploy &&
cp -R '.aws-sam/build' '.aws-sam/deploy/' &&

$(docker compose exec app yq -i 'del(.Resources.ServerlasticFunction.Properties.Events)' .aws-sam/deploy/template.yaml) &&
$(docker compose exec app yq -i 'del(.Outputs.ServerlasticFunctionHttpApi)' .aws-sam/deploy/template.yaml) &&

sam deploy --template-file .aws-sam/deploy/template.yaml --config-file "${PWD}/samconfig.toml"
