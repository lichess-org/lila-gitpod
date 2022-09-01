# Getting Started

Click here to start a workspace:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/lichess-org/lila-gitpod)

It will take about 8-10 minutes. You can watch the progress in the 3 terminal windows that automatically open.

## Your Development Site

To get the URL for your development site, in a new terminal, type:

    gp url 9663

Once lila is running, your dev site will be available. You can check the status of the ports with:

    gp ports list

## Test accounts

Your database is preloaded with a number of test accounts:

    lichess  /  password   ROLE_SUPER_ADMIN
    admin    /  password   ROLE_ADMIN
    bobby    /  password
    mary     /  password

To see all other test accounts (admins, titled accounts, flagged accounts, bots, etc):

    mongosh lichess --quiet --file /workspace/lila-gitpod/scripts/mongodb/users.js

## Stopping Your Workspace

Done for the day or make a mistake and want to start over? No problem.

    gp stop

Or just leave it and it'll shut down when it's been idle for 30 minutes.
