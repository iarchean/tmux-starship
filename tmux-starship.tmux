#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/scripts"

# Ensure scripts directory exists
mkdir -p "$SCRIPTS_DIR"

# Copy script to scripts directory
cp "$CURRENT_DIR/scripts/starship.sh" "$SCRIPTS_DIR/starship.sh" 2>/dev/null || true

# Add script to tmux PATH
tmux set-option -gq "@starship_scripts_dir" "$SCRIPTS_DIR"

# Register starship_prompt format
tmux set-option -gq "@starship_prompt" "#($SCRIPTS_DIR/starship.sh)" 