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
plugins=(powerline dotenv)

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Work stuff
alias ssh-staging="ssh -i ~/.ssh/moto-cluster.pem $STAGING_ADDR"
alias ssh-dev="ssh -i ~/.ssh/moto-cluster.pem $DEV_ADDR"

# Emacs stuff
# if [[ -n ${INSIDE_EMACS} ]]; then
#     # This shell runs inside an Emacs *shell*/*term* buffer.
#     prompt walters
#     unsetopt zle
# fi

# Start emacs in background from terminal
em() { (emacs $@ &>/dev/null &) }

# pi stuff
function sshpi {
    if [ -z "$1" ]; then
        ssh jdliss@192.168.1.55
    else
        ssh $1@192.168.1.55
    fi
}

# crystal stuff
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gb="git branch"
alias gl="git log --oneline"
alias gpo="git push origin"
alias gpom="git push origin master"
alias logp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# misc aliases
alias be="bundle exec"
alias pro="vim ~/.zshrc"
alias src="source ~/.zshrc"
# alias vim="nvim"

alias cd..="cd .."
alias ..="cd .."

function mkcd {
    mkdir $1
    cd $1
}

cd() { builtin cd "$@"; ls; }

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/libiconv/bin:$PATH"
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jdliss/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jdliss/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jdliss/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jdliss/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
