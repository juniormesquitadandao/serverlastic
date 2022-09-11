# Serverlastic

Elasticity of any web server with docker and aws lambda.

![Architecture](https://raw.githubusercontent.com/juniormesquitadandao/serverlastic/main/sam/architecture.png)

### How it works?

Transforms your project's docker into the AWS Lambda NodeJS Runtime Interface Client, to initiate a local http and serve requests to the URLs of AWS Lambda functions. It supports any programming language and generates only one: cloudformation, cloudwatch, ecr, s3 and lambda function. Integrates with r53, cloudfront, vpc, rds proxy, codepipeline, codebuild and more.

### How to use it?

- Configure docker in your project: https://github.com/juniormesquitadandao/gerlessver
- Install aws cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-version.html
- Install aws sam cli: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html
- Configure aws credentials: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html
- Download and run serverlastic in your project:
```sh
cd project
  wget -q https://raw.githubusercontent.com/juniormesquitadandao/serverlastic/main/install.sh \
    -O serverlastic.sh && sh serverlastic.sh
  exit
```
- Update "sam/devops/server/install.sh" to install all your project's dependencies during docker build.
- Update "sam/devops/server/server.sh" to start local http when starting new lambda function for testing, local and cloud usage.
- Update "sam/config.toml" to setup cloudformation, s3 and ecr.
- Update "sam/template.yaml" for setup function: name, timeout, memory, concurrency, environment variables and docker base image.
- Configure your project to respond "/samples/[file].[format]" with files of "public/samples/*" for testing.
- Run tests:
```sh
cd project
  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/install.sh
  ./sam/devops/lambda/test.sh
    # CTRL+C
  exit
```
- Run local:
```sh
cd project
  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/local.sh
    # CTRL + SHIFT + T
  ./sam/devops/lambda/benchmarking.sh 2 http://dockerhost:3001
    # browser: http://localhost:3001
  exit
```
- Run cloud:
```sh
cd project
  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/deploy.sh
    # browser: ServerlasticFunctionUrl.FunctionUrl
  ./sam/devops/lambda/benchmarking.sh 2 ServerlasticFunctionUrl.FunctionUrl
  exit
```
- Delete resources:
```sh
cd project
  ./sam/devops/lambda/delete.sh
  exit
```

### Examples

- Node on Http Server: https://github.com/juniormesquitadandao/serverlastic/tree/main/examples/node_on_http_server
- Ruby on Rails: https://github.com/juniormesquitadandao/serverlastic/tree/main/examples/ruby_on_rails
