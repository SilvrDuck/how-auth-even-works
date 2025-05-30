#!/bin/bash
set -e

# Venv
uv venv
uv sync --all-packages

# Pre-commits
pre-commit install

# Automate env auto activation for zsh
if ! grep -q "source \$PWD/.venv/bin/activate # auto-venv" ~/.zshrc; then
    echo '[[ -f "$PWD/.venv/bin/activate" && -z "$VIRTUAL_ENV" ]] && source "$PWD/.venv/bin/activate" # auto-venv' >> ~/.zshrc
fi
