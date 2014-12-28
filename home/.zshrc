
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt extendedglob nomatch notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/Users/chase/.zshrc'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

autoload -Uz compinit
compinit

export EDITOR=vim
