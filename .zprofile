#!/bin/sh
# env vars to set on login, zsh settings in ~/config/zsh/.zshrc
# add `export ZDOTDIR="$HOME/.config/zsh"` to /etc/zsh/zshenv in order to place this file at .config/zsh/.zprofile

# default programs
export EDITOR="nvim"
export TERM="alacritty"
export TERMINAL="alacritty"
export BROWSER="firefox"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# add scripts to path
export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages

