## Lichess.org Development Environment

You can use Gitpod (a free, online, VS Code-like IDE) for contributing. With a single click, it will launch a workspace and automatically:

- Clone the necessary Lichess repositories
- Install all the dependencies
- Seed your database with test data
- Start lila

So that you can start contributing within a few minutes.

Click here to open in Gitpod: https://gitpod.io/#https://github.com/rosen-score/lila-gitpod

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/rosen-score/lila-gitpod)

### Test accounts

You can login with a test account:

```
lichess  /  password  ROLE_SUPER_ADMIN
admin    /  password  ROLE_ADMIN
bobby    /  password
mary     /  password
```

View all test accounts (other admin types, titled accounts, flagged accounts, bots, etc):

```bash
mongosh lichess --quiet --file ~/workspace/lila-gitpod/scripts/mongodb/users.js
```

**Optional Services:**

When the workplace starts, open a new terminal for each:

1. **lila-fishnet:** "Play with the computer"

    ```bash
    cd /workspace/lila-fishnet/
    sbt run -Dhttp.port=9665
    ```

2. **fishnet clients:**

    ```bash
    cd /workspace/fishnet/
    cargo build
    ```

    For "Play with the computer":

    ```bash
    cargo run -- --endpoint http://localhost:9665/fishnet/
    ```

    For "Request a computer analysis"
   
    ```bash
    cargo run -- --endpoint http://localhost:9663/fishnet/
    ```

## Credits

Base Dockerfile modified from https://github.com/benediktwerner/lichess-docker
