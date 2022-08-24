# Email Development

Lichess sends various emails (welcome, password reset, move notifiations for correspondence games, etc).

By default, any emails from your development site will not really be sent, and only show in the logs of the `lila` terminal.

If you're working on emails, you may find it helpful to use [MailHog](https://github.com/mailhog/MailHog) to debug them and get a more inbox-type view where you can see the rendered HTML emails.

1. Append these 2 lines to `/workspace/lila/conf/application.conf`:

    ```
    mailer.primary.mock = false
    mailer.primary.tls = false
    ```

2. Restart lila to apply the config changes (see [recompiling lila](/development/#recompiling-lila))

3. Then start MailHog:

    ```bash
    go get github.com/mailhog/MailHog
    sudo ~/go/bin/MailHog -smtp-bind-addr 0.0.0.0:587
    ```

When you trigger an email to be sent, it will show in the MailHog UI which is available at the URL when you you type `gp url 8025` in a terminal.
