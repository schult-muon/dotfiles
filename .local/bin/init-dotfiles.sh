#!/bin/sh

# https://www.atlassian.com/git/tutorials/dotfiles
/usr/bin/git clone --bare git@github.com:schult/dotfiles.git "$HOME/.dotfiles"
alias config='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
config config --local status.showUntrackedFiles no
# https://morgan.cugerone.com/blog/workarounds-to-git-worktree-using-bare-repository-and-cannot-fetch-remote-branches/
config config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
