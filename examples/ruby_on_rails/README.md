# Serverlastic

- Setup: https://github.com/juniormesquitadandao/serverlastic

### Ruby on Rails

```sh
git clone git@github.com:juniormesquitadandao/serverlastic.git
# update "sam/config.toml" to setup s3 and ecr.
# Update "sam/template.yaml" for setup DATABASE_URL.
cd serverlastic/examples/ruby_on_rails
  docker compose config
  docker compose build
  docker compose up -d
  docker compose exec app bash
    bundle
    npm install
    rails db:create db:migrate
    rails s
    # Brower: http://localhost:3001
    # Press: CTRL+C

    exit
  docker compose down

  sh ./sam/devops/lambda/chmod.sh
  ./sam/devops/lambda/build.sh
  ./sam/devops/lambda/install.sh
  ./sam/devops/lambda/test.sh
    # CTRL+C

  ./sam/devops/lambda/local.sh
    CTRL + SHIFT + T
  ./sam/devops/lambda/benchmarking.sh 2 http://dockerhost:3001
    # browser: http://localhost:3001
    # CTRL+C

  ./sam/devops/lambda/deploy.sh
    # browser: ServerlasticFunctionUrl.FunctionUrl
  ./sam/devops/lambda/benchmarking.sh 2 ServerlasticFunctionUrl.FunctionUrl

  ./sam/devops/lambda/delete.sh
  exit
```
