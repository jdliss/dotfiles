alias vim="nvim"
alias be="bundle exec"
alias pro="vim ~/.zshrc"
alias src="source ~/.zshrc"
alias ra="ranger"
alias rang="ranger"
alias cd..="cd .."
alias ..="cd .."
alias ls="/usr/local/bin/gls --color"
alias ll="ls -la --group-directories-first"

function mkcd {
    mkdir $1
    cd $1
}

cd() { builtin cd "$@"; ls; }
