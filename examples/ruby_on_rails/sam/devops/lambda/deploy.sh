#!/bin/sh

set -e

rm -rf sam/.aws-sam/deploy &&
cp -R 'sam/.aws-sam/build' 'sam/.aws-sam/deploy/'

$(./sam/devops/lambda/run.sh yq -i 'del(.Resources.ServerlasticFunction.Properties.Events)' /home/user/serverlastic/sam/.aws-sam/deploy/template.yaml) &&
$(./sam/devops/lambda/run.sh yq -i 'del(.Outputs.ServerlasticFunctionHttpApi)' /home/user/serverlastic/sam/.aws-sam/deploy/template.yaml) &&

sam deploy --template-file sam/.aws-sam/deploy/template.yaml --config-file "${PWD}/sam/config.toml" $1
