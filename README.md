# Neovim Configuration for Linux Servers

This is a modular Neovim configuration optimized for SSH workflows. It features OSC 52 clipboard support, Treesitter highlighting, and none-ls auto-formatting.

## Prerequisites

Before installing, ensure your Linux server has the necessary build tools and libraries.

```sh
# Update and install system dependencies
sudo apt update
sudo apt install -y git curl build-essential wget
```

## Clipboard Support

This configuration uses OSC 52. This allows copying text from a remote server to your local workstation clipboard without extra server-side packages. Ensure your local terminal emulator (such as Windows Terminal, iTerm2, or Kitty) has "Allow Clipboard Access" enabled in its settings.

## Installation

1. Install Neovim (Manual Binary)
   Ubuntu's default package manager versions are often outdated. This config requires Neovim 0.10 or newer.

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim

export PATH="$PATH:/opt/nvim/bin"
```

2. Setup Configuration
   The configuration must be placed in the ~/.config/nvim/ directory.

```sh
mkdir -p ~/.config
```

```sh
git clone https://github.com/acelaya77/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

```sh
nvim
```

3. Post-Install Initialization
   Once Neovim is open, run these commands to finalize the setup:
   `:Lazy sync` (Ensures all plugins are installed)
   `:TSUpdate` (Compiles Treesitter parsers for syntax highlighting)
   `:Mason` (Verify that stylua, prettier, and ruff are installed for formatting)

## Directory Structure

init.lua: Main entry point and clipboard (OSC 52) setup.

lua/core/: Fundamental Vim options and keymaps.

lua/plugins/: Modular plugin definitions.

lua/plugins/none-ls.lua: Formatting and linting configuration.

## Troubleshooting

- Clipboard: If copying fails, ensure you are not running Neovim as 'sudo'. Sudo sessions are restricted from accessing user-level clipboard escape sequences.
- Treesitter: If you see errors about missing parsers, ensure 'build-essential' (specifically gcc or clang) is installed on the server, then run `:TSUpdate`.
