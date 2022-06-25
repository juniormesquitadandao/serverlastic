# Serverlastic

![Architecture](https://raw.githubusercontent.com/juniormesquitadandao/serverlastic/sp1/architecture.png)

- Configure host: https://github.com/juniormesquitadandao/gerlessver
- Install aws cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-version.html
- Install aws sam cli: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html
- Configure credentials: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html
```sh
cd serverlastic
  chmod +x devops/**/*.sh
  ./devops/compose/build.sh
  ./devops/compose/up.sh

  ./devops/compose/bash.sh
    node --version
    sam --version
    yq --version
    siege --version
    exit

  ./devops/sam/install.sh
  ./devops/sam/test.sh
    CTRL+C

  ./devops/sam/build.sh
  ./devops/sam/local.sh
    CTRL + SHIFT + T
      cd serverlastic
        ./devops/sam/benchmarking.sh 2 http://dockerhost:3000
    browser: http://localhost:3000
    CTRL+C

  ./devops/sam/deploy.sh
    browser: ServerlasticFunctionUrl.FunctionUrl
    ./devops/sam/benchmarking.sh 2 ServerlasticFunctionUrl.FunctionUrl

  ./devops/compose/down.sh

  ./devops/sam/delete.sh
```
