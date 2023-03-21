# Optional Services

By default, your lila-gitpod workspace will start with the basic services required to run lila.

Depending on what you're working on, you may want to enable some of these additional services.

## Stockfish

The [Stockfish](https://stockfishchess.org/) engine is used for a couple of things within lila:

- "Request a Computer Analysis" for post-game analysis
- "Play with the Computer"

To enable:

1. Compile the [fishnet](https://github.com/lichess-org/fishnet) client:
   ```
   cd /workspace/fishnet/
   cargo build
   ```

2. For **"Request a Computer Analysis"**, connect Fishnet to port 9663:
   ```
   cargo run -- --endpoint http://localhost:9663/fishnet/ --max-backoff 1s
   ```

3. For **"Play with the Computer"**, start the `lila-fishnet` service:
   ```
   cd /workspace/lila-fishnet/
   sbt run -Dhttp.port=9665
   ```
   Then, connect Fishnet to port 9665. In a separate terminal:
   ```
   cd /workspace/fishnet/
   cargo run -- --endpoint http://localhost:9665/fishnet/ --max-backoff 1s
   ```

## External Engine

The broker for external engine has its own service and port (9666). It must be started separately if you wish to use it.

```
git clone https://github.com/lichess-org/lila-engine.git /workspace/lila-engine
cd /workspace/lila-engine
LILA_ENGINE_LOG=lila_engine=debug,tower_http=debug cargo run -- --bind 127.0.0.1:9666
```

You can then connect an external engine client to port 9666.

## Email Debugging

Lichess sends various emails (welcome, password reset, move notifiations for correspondence games, etc).

By default, any emails from your development site will not really be sent, and only show in the logs of the `lila` terminal.

If you're working on emails, you may find it helpful to use [MailHog](https://github.com/mailhog/MailHog) to debug them and get a more inbox-type view where you can see the rendered HTML emails.

1. Append these 2 lines to `/workspace/lila/conf/application.conf`:
   ```
   mailer.primary.mock = false
   mailer.primary.tls = false
   ```

2. Restart lila to apply the config changes (see [Recompiling lila](/development/#recompiling-lila))

3. Then start MailHog:
   ```
   go get github.com/mailhog/MailHog
   sudo ~/go/bin/MailHog -smtp-bind-addr 0.0.0.0:587
   ```

When you trigger an email to be sent, it will now show in the MailHog UI which is available at the URL when you type `gp url 8025` in a terminal.

## lila-gif

The [lila-gif](https://github.com/lichess-org/lila-gif) service will enable the functionality:

- Game Analysis > Share & export > Game as GIF
- Game Analysis > Share & export > Screenshot current position

```
git clone https://github.com/lichess-org/lila-gif.git /workspace/lila-gif
cd /workspace/lila-gif
cargo run
```

You can verify it's working by running the following commands in another terminal:

```
curl http://localhost:6175/image.gif?fen=4k3/6KP/8/8/8/8/7p/8 --output image.gif
open image.gif
```

## picfit

[Picfit](https://github.com/thoas/picfit) is used to resize blog and streamer page images.

```
git clone https://github.com/thoas/picfit.git /workspace/picfit
cd /workspace/picfit
make build
echo '{"port": 3001}' > config.json
./picfit -c config.json
```

You can verify it's working going to the URL that's returned when you type `echo $(gp url 3001)/healthcheck` in a terminal.

## scalachess

[Scalachess](https://github.com/lichess-org/scalachess) will automatically be installed from the maven source. But if you wish to make changes and develop locally:

```
git clone https://github.com/lichess-org/scalachess.git /workspace/scalachess
cd /workspace/scalachess
sbt publishLocal
```

## pgn-viewer + chessground

[PGN Viewer](https://github.com/lichess-org/pgn-viewer) and [Chessground](https://github.com/lichess-org/chessground) will automatically be installed from NPM. You can install them locally if you wish to make changes and develop locally:

```
git clone https://github.com/lichess-org/pgn-viewer.git /workspace/pgn-viewer
git clone https://github.com/lichess-org/chessground.git /workspace/chessground

cd /workspace/lila/ui/site
pnpm link /workspace/pgn-viewer
pnpm link /workspace/chessground
```
