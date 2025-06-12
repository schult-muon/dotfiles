# Emacs mode
bindkey -e

#===================
# Misc config

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt always_last_prompt
setopt append_history
setopt auto_pushd
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt ignore_eof

unsetopt auto_cd
unsetopt correct
unsetopt correctall
unsetopt beep
unsetopt glob_dots

#===================
# Completion

autoload -U +X compinit
compinit

# Makefile target completion
# https://gitgist.com/posts/makefile-zsh-completion-guide/
function _makefile_targets {
    local -a targets
    targets=($(command make -qp 2>/dev/null | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ && !/^Makefile/ {split($1,A,/ /);for(i in A)print A[i]}' | sort -u))
    compadd $targets
}
compdef _makefile_targets make

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#===================
# Prompt format and color usage

autoload -U colors
autoload -U zsh/terminfo

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors

    PS1="%B%{${fg[green]}%}%n@%m%{${fg[white]}%}%b%# "
    RPS1="%B%{${fg[blue]}%}%~%b"
    PS2="%B%{${fg[green]}%}%1_%b%{${fg[white]}%}> "

    # https://geoff.greer.fm/lscolors/
    export LSCOLORS="exgxfxdxcxegedabagacad"
    export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

    # Use color in ls
    alias ls="ls --color=auto" # Linux
    export CLICOLOR=1 # macOS

    # Use color in completions
    zstyle ':completion:*' list-colors "${LS_COLORS}"

    # Use color in grep
    export GREP_COLOR='mt=01;35'
    alias grep="grep --color"
else
    PS1="%n@%m%# "
    RPS1="%~"
    PS2="%1_> "
fi

#===================
# Dotfile management

alias config='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

#===================
# Utility

alias xargs='xargs '  # Allow expansion of aliases in xargs
