
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt extendedglob nomatch notify
zstyle :compinstall filename '/Users/chase/.zshrc'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

autoload -Uz compinit
compinit

export PATH="$HOME/bin:$PATH"

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

# configure fuzzy autocomplete on tab
zstyle ':completion:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
    'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

export EDITOR=vim
export P4EDITOR=vim

bindkey -v

export BRAZIL_WORKSPACE_GITMODE=1

export PATH=$BRAZIL_CLI_BIN:$PATH
alias bb='/apollo/env/SDETools/bin/brazil-build'
alias br='/apollo/env/SDETools/bin/brazil-runtime-exec'
alias br-3rd-party="/apollo/env/BrazilThirdPartyTool/bin/brazil-third-party-tool"

## allow <c-s> to save files in vim
alias vim="stty stop '' -ixoff; vim"

setopt PROMPT_SUBST
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}
%{$fg_bold[white]%}>%{$reset_color%} '

alias rhel="ssh ${USER}.desktop.amazon.com"
alias cloud="ssh ${USER}.aka.corp.amazon.com"
alias cloud-2="ssh dev-dsk-ckkernan-2b-88f49aa5.us-west-2.amazon.com"

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

export TRAWLER="/workplace/ckkernan/trawler/src/DesignSurveyWebsite/rails-root"
export SURVEY_MANAGER="/workplace/ckkernan/survey/src/SurveyManagerWebsite/rails-root"
export TECH_SURVEY="/workplace/ckkernan/survey/src/SDESurveyWebsite/rails-root"
export FIRST_COMMIT="$HOME/rhel/workplace/ckkernan/FirstCommit/src/FirstCommitWebsite/rails-root"
export REPORTING="/workplace/ckkernan/reporting/src/TechSurveyReporting"
export ANALYTICS="/workplace/ckkernan/analytics/src/TechSurveyAnalyticsWebsite/rails-root"
export TE_CLIENT="/workplace/ckkernan/trainer/src/TrainerEngineClient"
export TE_WEBSITE="/workplace/ckkernan/trainer/src/TrainerEngineWebsite/rails-root"

export PATH="$PATH:/Applications/MATLAB_R2014b.app/bin"

# export JAVA_HOME=`/usr/libexec/java_home`

alias mysql-start="/usr/local/Cellar/mysql/5.6.22/support-files/mysql.server start"
alias mysql-stop="/usr/local/Cellar/mysql/5.6.22/support-files/mysql.server stop"

# export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
# export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH

export PATH="$PATH:$HOME/script"
export PATH="$PATH:$HOME/script/crux"

export NODE_BINARY_PATH="$HOME/.nodeenv/amazon-0.12.10/bin/node"
export I_WANT_NO_DEVTOOLS_SUPPORT_NOW_AND_FOREVER="NODE_BINARY_PATH"
export PHANTOMJS_BINARY=`which phantomjs`

export TECH_SURVEY_DATA_DUMP="/Users/ckkernan/Downloads/tech_survey_2015_dump.json"
export QUESTION_CATEGORY_RESPONSES="/Users/ckkernan/Downloads/survey_62_responses.json"
export QUESTION_CATEGORIES_CONFIG="/workplace/ckkernan/tech-survey/src/TechSurveyAnalyticsWebsite/rails-root/config/leader_of_leaders_2015_v2.yml"
export TECH_SURVEY_STRUCTURE="/workplace/ckkernan/tech-survey/src/TechSurveyAnalyticsWebsite/rails-root/survey_14.json"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export LESS='-R'

alias odin-proxy="ssh -fNL 2009:localhost:2009 ckkernan.aka.corp.amazon.com"

export GK_INSTALL_DIR=$HOME/ws/gk
source $HOME/ws/create-gk-aliases.sh
