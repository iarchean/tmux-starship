#!/bin/sh

# Ensure starship is installed and in PATH
if ! command -v starship >/dev/null 2>&1; then
    exit 1
fi

MODULE_NAME="$1"

if [ -z "$MODULE_NAME" ]; then
    # No module specified, get the full prompt
    starship prompt
else
    # Module specified, get only that module
    starship module "$MODULE_NAME"
fi | sed -E 's/\x1b\[[0-9;()]*[a-zA-Z@]?//g' # Filter out ANSI escape codes