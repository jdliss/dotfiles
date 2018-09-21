# Path to your oh-my-zsh installation.
export ZSH=/Users/jdliss/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="cobalt2"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git powerline dotenv zsh-autosuggestions)
plugins=(git powerline dotenv)

# rails stuff
alias nuke='rake db:migrate:reset'

# Emacs stuff
# if [[ -n ${INSIDE_EMACS} ]]; then
#     # This shell runs inside an Emacs *shell*/*term* buffer.
#     prompt walters
#     unsetopt zle
# fi

# pi stuff
function sshpi {
    if [ -z "$1" ]; then
        ssh jdliss@192.168.1.55
    else
        ssh $1@192.168.1.55
    fi
}

alias pihole-stat='python3 ~/pihole-info/pihole-status.py'

# crystal stuff
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# StarCluster stuff
# export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
alias scssh='starcluster sn -u moto -X'
alias sc="starcluster"

# alias jt="ruby ~/scripts/java_tree.rb"

# set Go home dir
# export GOPATH=$HOME/go
# alias gopath=$GOPATH

# go shortcuts
# alias letsgo="cd ~/go"

# rake shortcuts
# alias nuke='rake db:drop db:create db:migrate db:seed'

# git aliases
alias gs="git status"
# alias ga="git add ."
# alias gc="git commit -m"
alias gd="git diff"
alias gb="git branch"
alias gl="git log --oneline"
alias gpo="git push origin"
alias gpom="git push origin master"
alias logp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# misc aliases
alias be="bundle exec"
alias pro="vim ~/.zshrc"
# alias vim="nvim"

# # file path
# alias cdt="cd ~/turing"
# alias cd1="cd ~/turing/1module"
# alias cd2="cd ~/turing/2module"
# alias cd3="cd ~/turing/3module"
# alias cd4="cd ~/turing/4module"
# alias cdp="cd ~/turing/4module/projects"
# alias cdc="cd ~/turing/4module/classwork"
# alias pro="atom ~/.bash_profile"

# # NEVER GONNA GIVE YOU UP
# alias yolo="curl -L http://bit.ly/10hA8iC | bash"

# # command: navigation & listing
# alias h="history"
# alias ll="ls -1hA"

alias cd..="cd .."
alias ..="cd .."

# # navigate to folder commands
# alias py="cd ~/python"
# alias sw="cd ~/swift"
# alias exer="cd ~/exercism"
# alias posse="cd ~/turing/posse"
# alias mastermind="cd ~/turing/1module/projects/mastermind2"
# alias sorting="cd ~/turing/1module/projects/sorting-suite/"
# alias bst="cd ~/turing/1module/projects/bst"
# alias http="cd ~/turing/1module/projects/httpyykm"
# alias complete_me="cd ~/turing/1module/projects/complete_me"
# alias black-thursday="cd ~/turing/1module/projects/black_thursday"
# alias task="cd ~/turing/2module/projects/task_manager"
# alias robot="cd ~/turing/2module/projects/robot_world"
# alias rush="cd ~/turing/2module/projects/rush-hour-skeleton"
# alias mix="cd ~/turing/2module/projects/mix-master"
# alias shop="cd ~/turing/2module/projects/little_shop"
# alias pivot="cd ~/turing/3module/projects/pivot"
# alias api="cd ~/turing/3module/projects/api-curious"
# alias coinz="cd ~/turing/3module/projects/clarkebase"
# alias game="cd ~/turing/4module/projects/game-time"

function mkcd {
    mkdir $1
    cd $1
}

cd() { builtin cd "$@"; ls; }

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# Add rbenv to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="${PATH}:${HOME}/.rbenv/bin"
export PATH="/usr/local/opt/libiconv/bin:$PATH"
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jdliss/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jdliss/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jdliss/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jdliss/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
