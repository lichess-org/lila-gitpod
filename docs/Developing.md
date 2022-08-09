# Developing within Gitpod

## Test accounts

You can login with a test account:

```
lichess  /  password  ROLE_SUPER_ADMIN
admin    /  password  ROLE_ADMIN
bobby    /  password
mary     /  password
```

View all test accounts (other admin types, titled accounts, flagged accounts, bots, etc):

```bash
mongosh lichess --quiet --file /workspace/lila-gitpod/scripts/mongodb/users.js
```

## Navigating the code

The main Lichess code repositories have automatically been added to your Gitpod environment. You can navigate to them by clicking the menu icon in the top left, then File > Open Folder

> You can also use the keyboard shortcut of ⌘+Shift+P (Mac) or Ctrl+Shift+P (Windows), then type "Open Folder"

For example, the main Lichess code will be found in `/workspace/lila`.

## Recompiling/Restarting Lila

Normally when you make a change, you'll have to restart Lila. Go to the `lila` terminal, type Ctrl+c to stop the running process, then hit the Up arrow (or type `bloop run lila -m play.core.server.ProdServerStart`) and hit Enter.

Bloop will detect any changed files, recompile them, then start lila.

## Contributing your changes

If you make code changes within your Gitpod workspace and want to send a Pull Request to Lichess:

1. Fork the original repo (like https://github.com/lichess-org/lila) to your personal Github
2. On the Source Control tab on the left, click the 3 dots, "Remote" > "Add Remote" > "Add remote from Github", then select your lila fork
3. Click the 3 dots to create a branch, then commit your changes, and publish the branch to your fork
4. You can then create the Pull Request on Github

## Making your dev site public

By default, you're the only one who can view your Lichess dev site. If you wish to make it available to others, click the list of ports in the bottom right, then change the port visibility to public for 9663 and 9664.

## Optional Services

When the workplace starts, open a new terminal for each:

### lila-fishnet - "Play with the computer"

```bash
cd /workspace/lila-fishnet/
sbt run -Dhttp.port=9665
```

### fishnet clients

```bash
cd /workspace/fishnet/
cargo build

# For "Play with the computer"
cargo run -- --endpoint http://localhost:9665/fishnet/

# For "Request a computer analysis"
cargo run -- --endpoint http://localhost:9663/fishnet/
```

## Stopping Gitpod

Done for the day or make a mistake and want to start over? No problem. Click "Gitpod" in the bottom left, then "Stop Workspace". Or just leave it and it'll shut down when it's been idle for 30 minutes.
