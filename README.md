# tmux-starship

A tmux plugin that displays starship prompt in the tmux status bar.

## Features

- Display full starship prompt in tmux status bar
- Support for displaying specific starship modules
- Automatic ANSI escape sequence cleaning

## Installation

Install using [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm):

1. Add the following line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'iarchean/tmux-starship'
```

2. Press `prefix` + `I` to install the plugin

## Usage

### Display full prompt

```tmux
set -g status-right "#{starship_prompt}"
```

### Display specific module

```tmux
set -g status-right "#{starship_prompt git_branch}"
```

## Requirements

- tmux
- [starship](https://starship.rs/)

## License

MIT
