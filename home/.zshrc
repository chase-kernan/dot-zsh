
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
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

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

export PATH="/apollo/env/SDETools/bin:$PATH"
alias br='/apollo/env/SDETools/bin/brazil-runtime-exec'
alias br-3rd-party="/apollo/env/BrazilThirdPartyTool/bin/brazil-third-party-tool"

## allow <c-s> to save files in vim
alias vim="stty stop '' -ixoff; vim"

setopt PROMPT_SUBST
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}
%{$fg_bold[white]%}>%{$reset_color%} '

RHEL_SSHFS_HOST="${USER}.desktop.amazon.com"
RHEL_SSHFS_DIR="$HOME/rhel"

alias rhel-mount="mount-sshfs $RHEL_SSHFS_DIR $RHEL_SSHFS_HOST"
alias rhel-umount="diskutil unmount force $RHEL_SSHFS_DIR"

function mount-sshfs() {
    local mount_point=$1
    local hostname=$2
    local username=${3:-${USER}}
    local options="auto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,transform_symlinks,follow_symlinks,volname=${hostname}"

    if [ ! -d "$mount_point" ]; then
        echo "Creating '$mount_point'...";
        mkdir -p "$mount_point"
    fi

    sshfs -p 22 ${username}@${hostname}:/ "$mount_point" -o "$options"
}

export SURVEY_MANAGER="$HOME/rhel/workplace/ckkernan/Survey/src/SurveyManagerWebsite/rails-root"
export TECH_SURVEY="$HOME/rhel/workplace/ckkernan/Survey/src/SDESurveyWebsite/rails-root"

export PATH="$PATH:/Applications/MATLAB_R2014b.app/bin"

export JAVA_HOME=`/usr/libexec/java_home`

alias mysql-start="/usr/local/Cellar/mysql/5.6.22/support-files/mysql.server start"
alias mysql-stop="/usr/local/Cellar/mysql/5.6.22/support-files/mysql.server stop"

# export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
# export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH
