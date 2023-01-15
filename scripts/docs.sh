#!/bin/sh

# Serve the lila-gitpod docs

python3.9 -m pip install mkdocs mkdocs-material
python3.9 -m mkdocs serve --config-file /workspace/lila-gitpod/mkdocs.yml
