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

    bloop run lila -m play.core.server.ProdServerStart

Bloop will detect any changed files, recompile them, then start lila.

## Recompiling frontend assets

If you're working on UI elements, you may need to recompile the CSS or Javascript.

#### Recompile everything

    cd /workspace/lila
    ./ui/build

That takes a few minutes to run. Instead, maybe you want to compile something more specific:

#### CSS

    cd /workspace/lila/ui
    npm run gulp css-dev

???+ tip

    To automatically re-compile as you edit any sass files:

        npm run gulp css

#### Javascript

If you're working on a specific UI component, you can `cd` into it and compile just that component.

For example, if we're working on the `keyboardMove` component:

    cd /workspace/lila/ui/keyboardMove
    yarn run dev

???+ tip

    To automatically re-compile as you edit any Typescript files:

        yarn run dev --watch

## Updating Routes

If you edit the `conf/routes` file, you'll need to update the route cache. Bloop will not automatically detect changes to this file.

Stop lila (see [Recompiling lila](#recompiling-lila) above), then run:

    cd /workspace/lila
    ./lila playRoutes
