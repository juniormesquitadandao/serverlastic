# Serverlastic

- Setup: https://github.com/juniormesquitadandao/serverlastic

### Node on Http Server

```sh
git clone git@github.com:juniormesquitadandao/serverlastic.git
# update "sam/config.toml" to setup s3 and ecr.
cd serverlastic/examples/node_on_http_server
  docker compose config
  docker compose build
  docker compose up -d

    node --version
    npm install
    npm start
    # browser: http://localhost:8080
    # CTRL+C
    exit
  docker compose down

  sh ./sam/devops/chmod.sh
  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/install.sh
  ./sam/devops/lambda/test.sh
    # CTRL+C

  ./sam/devops/lambda/local.sh
    # CTRL + SHIFT + T
  ./sam/devops/lambda/benchmarking.sh 2 http://dockerhost:3001
    # browser: http://localhost:3001
    # CTRL+C

  ./sam/devops/lambda/deploy.sh
    # browser: ServerlasticFunctionUrl.FunctionUrl
  ./sam/devops/lambda/benchmarking.sh 2 ServerlasticFunctionUrl.FunctionUrl

  ./sam/devops/lambda/delete.sh
  exit
```
