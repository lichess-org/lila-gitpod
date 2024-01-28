# Getting Started

Click here to start a workspace:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/new/#https://github.com/lichess-org/lila-docker)

It will take about 10-15 minutes. You can watch the progress in the terminal that automatically opens.

## Your Development Site

To get the URL for your development site, in a new terminal, type:

```bash
gp url 8080
```

Once lila is running, your dev site will be available. You can check the status on the PORTS tab above your terminal.

## Test accounts

Your database is preloaded with a number of test accounts:

    admin    /  password   ROLE_ADMIN
    bobby    /  password
    mary     /  password

To see all other test accounts (admins, titled accounts, flagged accounts, bots, etc):

```bash
docker compose run --rm python python /scripts/users.py
```

## Stopping Your Workspace

Done for the day or make a mistake and want to start over? No problem.

```bash
gp stop
```

Or just leave it and it'll shut down when it's been idle for 30 minutes.
