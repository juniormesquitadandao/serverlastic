#!/bin/sh

set -e

rm -rf /tmp/serverlastic.zip /tmp/serverlastic tmp/sam tmp/Dockerfile.sam

wget https://github.com/juniormesquitadandao/serverlastic/archive/refs/heads/main.zip -q --show-progress -O /tmp/serverlastic.zip

unzip -q -d /tmp/serverlastic /tmp/serverlastic.zip

mv /tmp/serverlastic/serverlastic-main/sam tmp/

mv /tmp/serverlastic/serverlastic-main/Dockerfile.sam tmp/

sed "s/YOUR_SERVER_IMAGE/$(basename $PWD)_app/g" -i tmp/sam/template.yaml
sed "s/YOUR_FUNCTION_NAME/$(basename $PWD)_function/g" -i tmp/sam/template.yaml

sed "s/YOUR_STACK_NAME/$(basename $PWD)_function_stack/g" -i tmp/sam/config.toml
sed "s/YOUR_S3_PREFIX/$(basename $PWD)_function/g" -i tmp/sam/config.toml

echo 'Stack Name? ENTER'
echo 'AWS Region? ENTER'
echo 'Confirm changes before deploy? N'
echo 'Allow SAM CLI IAM role creation? Y'
echo 'Disable rollback? Y'
echo 'Function Url may not have authorization defined, Is this okay? y'
echo 'Save arguments to configuration file? Y'
echo 'SAM configuration file [../sam/config.toml]? ENTER'
echo 'SAM configuration environment? ENTER'

chmod +x tmp/sam/devops/**/*.sh

./sam/devops/lambda/deploy.sh --guided

rm -rf /tmp/serverlastic.zip /tmp/serverlastic
