# tmux-starship

A tmux plugin to render your [Starship](https://starship.rs/) prompt in the tmux status bar.

## Prerequisites

*   `starship` must be installed and accessible in your system's `PATH`.
*   `tmux` (version 1.9 or higher recommended for TPM)
*   [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm)

## Installation with TPM

1.  Add the plugin to your `~/.tmux.conf`:
    ```tmux
    set -g @plugin 'iarchean/tmux-starship'
    ```

2.  Press `prefix` + `I` (capital I, as in **I**nstall) to fetch the plugin and source it.

    If you don't have TPM, you can clone the repo and source `tmux-starship.tmux` manually.

## Usage

This plugin provides a tmux user option `@starship_cmd` which points to the helper script responsible for fetching and formatting the Starship prompt.

You use this option within a tmux `#(shell-command)` interpolation.

**To display the full Starship prompt:**

```tmux
# In your ~/.tmux.conf
set -g status-right "#( #(@starship_cmd) )"
# or status-left, or anywhere else you like
```

**To display a specific Starship module (e.g., `git_branch`):**

```tmux
# In your ~/.tmux.conf
set -g status-right "#( #(@starship_cmd) git_branch )"
```

You can combine this with other tmux status elements:

```tmux
set -g status-right "Starship: #( #(@starship_cmd) ) | %H:%M %d-%b-%y"
set -g status-left "Session: #{session_name} | Git: #( #(@starship_cmd) git_branch )"
```

**Important:**
The output from Starship (colors, formatting) is stripped to plain text. Tmux status lines have their own styling capabilities if you wish to color the output. For example:
```tmux
set -g status-right "#[fg=green]#( #(@starship_cmd) )#[default]"
```

### Refresh Interval

Tmux updates the status line at an interval defined by `status-interval`. The default is 15 seconds. If you want more frequent updates (e.g., for git branch changes to appear faster), you can set it lower:

```tmux
set -g status-interval 5 # Update every 5 seconds
```
Keep in mind that very frequent updates for complex prompts might consume more CPU.

## How it Works

The plugin runs a small shell script (`scripts/helper.sh`) that calls `starship prompt` or `starship module <module_name>`. It then uses `sed` to strip all ANSI escape codes (colors, formatting) from Starship's output, as these are not typically rendered correctly in the tmux status bar and can clutter it.

## Troubleshooting

*   **Empty output or error:**
    1.  Ensure `starship` is installed and in your `PATH`. Try running `starship prompt` in your shell.
    2.  Ensure the plugin is installed correctly via TPM.
    3.  Check tmux messages: `prefix` + `:` then `show-messages`.
*   **ANSI codes still visible:** The `sed` command in `scripts/helper.sh` might need adjustment for very unusual ANSI sequences. Please open an issue if you encounter this.

## Contributing

Contributions, issues, and feature requests are welcome!

## License

[MIT](LICENSE.md) (You'll need to add a LICENSE.md file, typically MIT for such projects)
```

---

**4. `LICENSE.md` (Recommended)**

Create a `LICENSE.md` file. The MIT license is common and permissive:

```
MIT License

Copyright (c) [Year] [Your Name/GitHub Username - e.g., iarchean]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
