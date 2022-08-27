# Using Stockfish

The [Stockfish](https://stockfishchess.org/) engine is used for a couple of things within lila:

1. "Request a Computer Analysis" for post-game analysis
2. "Play with the Computer"

## Instructions

1. Compile the [fishnet](https://github.com/lichess-org/fishnet) client:

   ```
   cd /workspace/fishnet/
   cargo build
   ```

2. For **"Request a Computer Analysis"**, connect Fishnet to port 9663:

   ```
   cargo run -- --endpoint http://localhost:9663/fishnet/ --max-backoff 1s
   ```

3. For **"Play with the Computer"**, connect Fishnet to port 9665:

   ```
   cargo run -- --endpoint http://localhost:9665/fishnet/ --max-backoff 1s
   ```

   Then, start the `lila-fishnet` service. In a separate terminal:

   ```
   cd /workspace/lila-fishnet/
   sbt run -Dhttp.port=9665
   ```
