#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux set-option -g @starship_cmd "'${CURRENT_DIR}/scripts/helper.sh'"