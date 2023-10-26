# Working with Lila

!!! info "What is lila?"

    Lichess is primarily written in the Scala programming language. The name for the main Lichess codebase is "lila", which stands for "**_Li_**chess in Sca**_la_**".

## Navigating the code

The main Lichess code repositories have automatically been added to your workspace. You can find them at:

```bash
ls /workspace/lila-docker/repos
```

To open them in your workspace:

```bash
open -r repos/lila      # open main lila repository
open -r repos/lila-ws   # open websocket repository
```

## Recompiling lila

When you edit a scala file, you'll have to restart lila. In a terminal, type:

```bash
docker compose restart lila
```

## Recompiling frontend assets

If you're working on TypeScript or SCSS files, you can automatically detect the changes and recompile the assets. In a terminal, type:

```bash
docker compose run --rm ui bash -c "/lila/ui/build -w"
```

## Updating Routes

If you edit the `conf/routes` file, you'll need to update the route cache.

```bash
docker compose exec lila bash -c "./lila playRoutes"
```
