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
