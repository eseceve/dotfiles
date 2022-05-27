export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
export EDITOR=vim

# Homebrew
## Core
eval "$(/opt/homebrew/bin/brew shellenv)"
### Plugins
source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh


# Enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Fix locale
export LC_ALL=en_US.UTF-8

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This load nvm bash_completion

# Aliases
source ~/.aliases
