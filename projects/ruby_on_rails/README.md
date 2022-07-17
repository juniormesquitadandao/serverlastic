# Serverlastic

![Architecture](https://raw.githubusercontent.com/juniormesquitadandao/serverlastic/main/sam/architecture.png)

- Configure host: https://github.com/juniormesquitadandao/gerlessver
- Install aws cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-version.html
- Install aws sam cli: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html
- Configure credentials: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html

### Ruby on Rails

```sh
cd serverlastic/projects/ruby_on_rails
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
```
