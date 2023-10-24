#!/bin/sh

# Serve the lila-gitpod docs

python -m pip install mkdocs mkdocs-material
python -m mkdocs serve
