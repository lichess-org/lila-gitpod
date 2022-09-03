Consider using a lila-gitpod workspace while you develop your API integration before pointing to the production Lichess.org.

- Avoid getting rate-limited
- Don't worry about messing anything up
- If developing a bot, keep test games out of your bot's game history

## Bot Development

1. [Create your workspace](getting-started.md)
2. Create an account for your bot
3. Make port 8080 public, so you can access it from your bot's server
4. Point your bot to use your workspace's development site instead of `lichess.org`

    !!! info "Using lichess-bot"

        If you're using the [lichess-bot](https://github.com/ShailChoksi/lichess-bot) project, set the [`url` value in `config.yml`](https://github.com/ShailChoksi/lichess-bot/blob/master/config.yml.default) to your development site.
