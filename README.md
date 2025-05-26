# tmux-starship

A tmux plugin to display [Starship](https://starship.rs/) prompt in the tmux status bar.

## Prerequisites

* `starship` installed and accessible in your system's `PATH`
* `tmux` installed (version 1.9 or higher recommended)
* [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm) installed

## Installation

1. Add the plugin to your `~/.tmux.conf`:
    ```tmux
    set -g @plugin 'iarchean/tmux-starship'
    ```

2. Press `prefix` + `I` (capital I) to install and load the plugin.

## Usage

Use `#(@starship_cmd)` in your tmux configuration to display the Starship prompt:

```tmux
# Display full Starship prompt
set -g status-right "#( #(@starship_cmd) )"

# Display specific Starship module (e.g., git_branch)
set -g status-right "#( #(@starship_cmd) git_branch )"

# Combine with other tmux status elements
set -g status-right "Starship: #( #(@starship_cmd) ) | %H:%M %d-%b-%y"
```

## Update Interval

By default, tmux updates the status bar every 15 seconds. To update more frequently, adjust `status-interval`:

```tmux
set -g status-interval 5 # Update every 5 seconds
```

## License

[MIT](LICENSE.md)