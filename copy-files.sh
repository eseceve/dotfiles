#!/bin/bash

# copy dotfiles and wait until finish
cp $(cat FILES_TO_COPY) ~/. &

# copy vim configuration
cp -r .vim ~/.

# copy zsh custom plugins
mkdir ~/.oh-my-zsh/custom/plugins/cdnvm
cp cdnvm.plugin.zsh ~/.oh-my-zsh/custom/plugins/cdnvm/.

# copy and update (user root directory) of iterm2's profile
sed -e "s,<your_username>,$(whoami)," itermProfile.json > ~/Documents/itermProfile.json

# Update your git global configuration
read -p "Enter the name you want to use for GIT: " git_name
read -p "Enter the email you want to use for GIT: " git_email
sed -e "s,<your_git_name>,$git_name," -e "s,<your_git_email>,$git_email," .gitconfig > ~/.gitconfig

