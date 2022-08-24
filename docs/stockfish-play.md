# Play with the computer

## Start the [fishnet](https://github.com/lichess-org/fishnet) client:

```bash
cd /workspace/fishnet/
cargo build
```

```bash
cargo run -- --endpoint http://localhost:9665/fishnet/ --max-backoff 1s
```

!!! info

    Note the port difference from [Computer Analysis](stockfish-analysis.md), which uses port `9663`.

    You'll only need to run `cargo build` once, even if you also use it for Computer Analysis.


## Start [lila-fishnet](https://github.com/lichess-org/lila-fishnet):

    cd /workspace/lila-fishnet/
    sbt run -Dhttp.port=9665