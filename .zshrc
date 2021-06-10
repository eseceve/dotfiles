DEFAULT_USER=scv
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"

# User configuration
source ~/.bash_profile

# Ignore duplicate entries in zsh history
export HISTCONTROL=erasedups

# Plugins
# brew install autojump git-extras tmux
plugins=(
  autojump
  brew
  git
  osx
  tmux tmuxinator
  # custom
  cdnvm
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
DISABLE_UPDATE_PROMPT="true" # enable oh-my-zsh auto-update
DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable marking untracked files under VCS as dirty
ZSH_DISABLE_COMPFIX="true"

NVM_AUTOLOAD=1 # automatically load a node version when if finds a .nvmrc file

zstyle ':completion:*' special-dirs true

# disable correction
unsetopt correct_all
source ~/.aliases
