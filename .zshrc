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

export PATH="/usr/local/opt/libiconv/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
    source ~/.localrc
else
    echo "Could not find .localrc"
fi

config_files=(
    work
    pi
    emacs
    git
    crystal
    rust
    google
    nvm
    zsh
    fzf
    general
)

for filename in "${config_files[@]}"; do
    if [[ -a ~/.rcconfig/$filename.sh ]]
    then
        source ~/.rcconfig/$filename.sh
    else
        echo "Could not find $filename.sh"
    fi
done


eval "$(rbenv init -)"
