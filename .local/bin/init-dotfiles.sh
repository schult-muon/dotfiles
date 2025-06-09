#!/bin/sh

/usr/bin/git clone --bare git@github.com:schult/dotfiles.git "$HOME/.dotfiles"
alias config='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
config config --local status.showUntrackedFiles no
