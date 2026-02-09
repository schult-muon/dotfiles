#!/bin/sh

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir="${HOME}/.dotfiles/" --work-tree="${HOME}"'
if [ ! -d "${HOME}/.dotfiles" ]; then
    /usr/bin/git clone --bare git@github.com:schult-muon/dotfiles.git "${HOME}/.dotfiles"
    config config --local status.showUntrackedFiles no
    # https://morgan.cugerone.com/blog/workarounds-to-git-worktree-using-bare-repository-and-cannot-fetch-remote-branches/
    config config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
    config switch -f main
    config branch --set-upstream-to=origin/main main
fi
config pull

apt update
apt install -y zsh

mkdir -p ${HOME}/.local/bin
cd ${HOME}/.local/bin

if [ ! -f nvim-linux-x86_64.appimage ]; then
    curl -sLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
    chmod +x nvim-linux-x86_64.appimage
    ./nvim-linux-x86_64.appimage --appimage-extract
    ln -sf squashfs-root/AppRun nvim
    ln -sf squashfs-root/AppRun vim
    ln -sf squashfs-root/AppRun vi
fi

if [ ! -f delta ]; then
    curl -sL https://github.com/dandavison/delta/releases/download/0.18.2/delta-0.18.2-x86_64-unknown-linux-gnu.tar.gz |
        tar xz delta-0.18.2-x86_64-unknown-linux-gnu/delta --strip-components=1
fi
