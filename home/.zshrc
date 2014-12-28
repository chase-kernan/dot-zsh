
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt extendedglob nomatch notify
zstyle :compinstall filename '/Users/chase/.zshrc'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

autoload -Uz compinit
compinit

if which brew > /dev/null; then export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"; fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD


## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

autoload -U colors
colors

export EDITOR=vim
export P4EDITOR=vim

bindkey -v

export BRAZIL_WORKSPACE_GITMODE=1

alias br='/apollo/env/SDETools/bin/brazil-runtime-exec'
alias br-3rd-party="/apollo/env/BrazilThirdPartyTool/bin/brazil-third-party-tool"

export TRAWLER="/workplace/ckkernan/Trawler/src/DesignSurveyWebsite/rails-root"
export SURMAN="/workplace/ckkernan/Survey/src/SurveyManagerWebsite/rails-root"

## allow <c-s> to save files in vim
alias vim="stty stop '' -ixoff; vim"
