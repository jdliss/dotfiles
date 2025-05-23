# source antidote package manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

export ZDOTDIR=~/.zephyr

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Custom aliases/functions
alias vim="nvim"
alias be="bundle exec"
alias pro="vim ~/.zshrc"
alias src="source ~/.zshrc"
# alias ra="ranger"
# alias rang="ranger"
alias cd..="cd .."
alias ..="cd .."
# alias ls="/usr/local/bin/gls --color"
alias ll="/usr/local/bin/gls -la --group-directories-first --color"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gb="git branch"
alias gl="git log --oneline" 
alias gpo="git push origin"
alias gpom="git push origin master"
alias logp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

function mkcd {
    mkdir $1
    cd $1
}

cd() { builtin cd "$@"; ls; }

# Ask for confirmation for `rm *' or `rm path/*'
setopt NO_rm_star_silent

# Env vars
export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-nvim}
export PAGER=${PAGER:-less}
export LANG=${LANG:-en_US.UTF-8}
# Set starship config to a better location
export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

