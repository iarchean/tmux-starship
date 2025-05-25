_STARSHIP_PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
_STARSHIP_HELPER_SCRIPT="${_STARSHIP_PLUGIN_DIR}/scripts/helper.sh"

tmux set-option -g @starship_cmd "'${_STARSHIP_HELPER_SCRIPT}'"