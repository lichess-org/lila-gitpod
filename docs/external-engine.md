The broker for external engine has its own service and port (9666). It must be started separately if you wish to use it.

```
cd /workspace/lila-engine
LILA_ENGINE_LOG=lila_engine=debug,tower_http=debug cargo run -- --bind 127.0.0.1:9666
```
