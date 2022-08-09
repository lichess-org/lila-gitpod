# Developing within Gitpod

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

## Stopping Gitpod

Done for the day or make a mistake and want to start over? No problem. Click "Gitpod" in the bottom left, then "Stop Workspace". Or just leave it and it'll shut down when it's been idle for 30 minutes.
