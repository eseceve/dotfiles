DEFAULT_USER=scv
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"

# Ignore duplicate entries in zsh history
export HISTCONTROL=erasedups

# Plugins
# brew install autojump git-extras hub tmux
plugins=(
  autojump
  bower brew
  colorize
  git
  osx
  tmux tmuxinator
  #custom
  cd
  gitignore
)

source $ZSH/oh-my-zsh.sh

# ~/bin in PATH
if [[ -d ~/bin ]]; then
  export PATH=$PATH:~/bin
fi

# keep history file between sessions
DIRSTACKSIZE=15
HISTSIZE=10000000
HIST_STAMPS="dd/mm/yyyy"
SAVEHIST=10000000
HISTFILE=~/.zsh_history
ENABLE_CORRECTION="true" # enable commando auto-correction 
DISABLE_UPDATE_PROMPT="true" # enable oh-my-zsh auto-update
DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable marking untracked files under VCS as dirty


zstyle ':completion:*' special-dirs true

# disable correction
unsetopt correct_all

# User configuration
source ~/.bash_profile
