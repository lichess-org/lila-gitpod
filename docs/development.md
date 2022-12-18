# Working with Lila

!!! info "What is lila?"

    Lichess is primarily written in the Scala programming language. The name for the main Lichess codebase is "lila", which stands for "**_Li_**chess in Sca**_la_**".

## Navigating the code

The main Lichess code repositories have automatically been added to your workspace. You can find them at:

    ls /workspace

To open them in your workspace:

    open -r /workspace/lila      # open main lila repository
    open -r /workspace/lila-ws   # open websocket repository

## Recompiling lila

When you edit a scala file, you'll have to restart `bloop`. Go to the `lila` terminal, type `Ctrl+c` to stop the running process, then rerun:

    bloop run lila -m lila.app.Lila

Bloop will detect any changed files, recompile them, then start lila.

## Recompiling frontend assets

If you're working on TypeScript or SCSS files, `./ui/build -w` will automatically detect the changes and recompile the assets. You can see the output in the `ui` terminal.

## Updating Routes

If you edit the `conf/routes` file, you'll need to update the route cache. Bloop will not automatically detect changes to this file.

Stop lila (see [Recompiling lila](#recompiling-lila) above), then run:

    cd /workspace/lila
    ./lila playRoutes
