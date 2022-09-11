#!/bin/sh

set -e

rm -rf /tmp/serverlastic.zip /tmp/serverlastic serverlastic.sh sam Dockerfile.sam public/samples
wget https://github.com/juniormesquitadandao/serverlastic/archive/refs/heads/main.zip -q --show-progress -O /tmp/serverlastic.zip
unzip -q -d /tmp/serverlastic /tmp/serverlastic.zip

mv /tmp/serverlastic/serverlastic-main/sam .
mv /tmp/serverlastic/serverlastic-main/Dockerfile.sam .
mkdir -p public
mv /tmp/serverlastic/serverlastic-main/public/samples public

sed "s/YOUR_PROJECT_ORIGIN/$(basename $PWD)/g" -i sam/template.yaml
sed "s/YOUR_PROJECT_ORIGIN/$(basename $PWD)/g" -i sam/config.toml
sed "s/YOUR_PROJECT_DASH/$(basename $PWD | sed 's/_/-/g')/g" -i sam/config.toml
sed "s/YOUR_PROJECT_DASH/$(basename $PWD | sed 's/_/-/g')/g" -i sam/devops/lambda/delete.sh

rm -rf /tmp/serverlastic.zip /tmp/serverlastic serverlastic.sh

echo 'Stack Name? ENTER'
echo 'AWS Region? ENTER'
echo 'Confirm changes before deploy? N'
echo 'Allow SAM CLI IAM role creation? Y'
echo 'Disable rollback? Y'
echo 'ServerlasticFunction may not have authorization defined, Is this okay? y'
echo 'ServerlasticFunction may not have authorization defined, Is this okay? y'
echo 'Function Url may not have authorization defined, Is this okay? y'
echo 'Save arguments to configuration file? Y'
echo 'SAM configuration file [../sam/config.toml]? ENTER'
echo 'SAM configuration environment? ENTER'
echo 'Create managed ECR repositories for all functions? Y'

sh sam/devops/chmod.sh

sam deploy --template-file sam/template.yaml --config-file "${PWD}/sam/config.toml" --guided

