export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export EDITOR=vim

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.aliases
