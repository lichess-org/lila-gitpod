# lila-gif

[lila-gif](https://github.com/lichess-org/lila-gif) is an optional service you can run that will generate animated GIFs and screenshots of a game/position.

Enables the functionality:

- Game Analysis > Share & export > Game as GIF
- Game Analysis > Share & export > Screenshot current position

In a new terminal, run:

```
cd /workspace/lila-gif
cargo run
```

The lila-gif service will start on port 6175. You can test it by running the following command in your workspace:

```
curl http://localhost:6175/image.gif?fen=4k3/6KP/8/8/8/8/7p/8 --output image.gif
open image.gif
```
