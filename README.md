# Serverlastic

![Architecture](https://raw.githubusercontent.com/juniormesquitadandao/serverlastic/main/sam/architecture.png)

- Configure host: https://github.com/juniormesquitadandao/gerlessver
- Install aws cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-version.html
- Install aws sam cli: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html
- Configure credentials: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html

### Run your project

```sh
cd project
  wget -q https://raw.githubusercontent.com/juniormesquitadandao/serverlastic/main/install.sh -O serverlatic.sh && sh serverlatic.sh

  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/install.sh
  ./sam/devops/lambda/test.sh
    CTRL+C
  ./sam/devops/lambda/local.sh
    CTRL + SHIFT + T
      cd serverlastic
        ./sam/devops/lambda/benchmarking.sh 2 http://dockerhost:3000
    browser: http://localhost:3000
    CTRL+C

  ./sam/devops/lambda/deploy.sh
    browser: ServerlasticFunctionUrl.FunctionUrl
    ./sam/devops/lambda/benchmarking.sh 2 ServerlasticFunctionUrl.FunctionUrl

  ./sam/devops/lambda/delete.sh
```

### Development

```sh
git clone git@github.com:juniormesquitadandao/serverlastic.git
cd serverlastic
  docker compose build
  docker compose up -d
  docker compose exec app bash
    node --version
    npm install
    npm start
    browser: http://localhost:8080
    CTRL+C
    exit
  docker compose down

  chmod +x sam/devops/**/*.sh

  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/install.sh
  ./sam/devops/lambda/test.sh
    CTRL+C
  ./sam/devops/lambda/local.sh
    CTRL + SHIFT + T
      cd serverlastic
        ./sam/devops/lambda/benchmarking.sh 2 http://dockerhost:3000
    browser: http://localhost:3000
    CTRL+C

  ./sam/devops/lambda/deploy.sh
    browser: ServerlasticFunctionUrl.FunctionUrl
    ./sam/devops/lambda/benchmarking.sh 2 ServerlasticFunctionUrl.FunctionUrl

  ./sam/devops/lambda/delete.sh
```
