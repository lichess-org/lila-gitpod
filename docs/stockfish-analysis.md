# Computer Analysis

Start the [fishnet](https://github.com/lichess-org/fishnet) client:

```bash
cd /workspace/fishnet/
cargo build
cargo run -- --endpoint http://localhost:9663/fishnet/ --max-backoff 1s
```

!!! info

    Note the port difference from [Play with the Computer](stockfish-play.md), which uses port `9665`
