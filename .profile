# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Homebrew
if [ -x "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="$HOMEBREW_PREFIX/opt/python/libexec/bin:$PATH"
fi

# Rust
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Flutter
if [ -d "$HOME/Documents/Projects/flutter/bin" ] ; then
    export PATH=$HOME/Documents/Projects/flutter/bin:$PATH
fi

# Android
if [ -d "$HOME/Library/Android/sdk" ] ; then
    export ANDROID_HOME="$HOME/Library/Android/sdk"
fi

# Raspberry Pi Pico SDK
if [ -d "$HOME/Documents/Projects/pico-sdk" ] ; then
    export PICO_SDK_PATH="$HOME/Documents/Projects/pico-sdk"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export VISUAL="nvim"
export LESS="--mouse"

export ORAS_CACHE=~/.oras/cache

# Added to support pyenv
if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Added to support muon-cli repository
export PATH="$PATH:$HOME/bin/muon-cli/commands"

# Added to support muon-mono repository
export PATH="$PATH:$HOME/.local/gcc-arm-none-eabi-10.3-2021.10/bin"
