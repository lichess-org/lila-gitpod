# Computer Analysis

## Start the [fishnet](https://github.com/lichess-org/fishnet) client:

```bash
cd /workspace/fishnet/
cargo build
```

```bash
cargo run -- --endpoint http://localhost:9663/fishnet/ --max-backoff 1s
```

!!! info

    Note the port difference from [Play with the Computer](stockfish-play.md), which uses port `9665`

    You'll only need to run `cargo build` once, even if you also use it for _Play with the Computer_.
