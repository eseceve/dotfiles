# DotFiles

Backup of configuration files for my development environment

## Usage

1. Install Iterm 2 and config it
First, [download it from the official webpage](https://iterm2.com/downloads.html), install it and
then import the `itermProfile.json` from preferences panel

2. Clone
```sh
cd ~
git clone git@github.com:eseceve/dotfiles.git
```

3. Install Oh-My-ZSH
Follow [the official instructions](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

4. Install brew apps
```sh
brew install autojump gettext git git-extras node tmux vim
````

5. Install NVM
Prefer install it following [this official instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
instead of use Brew to avoid weird behaviors

6. Copy configuration files
```sh
cd ~/dotfiles
cp $(cat FILES_TO_COPY) ../.
```

7. Copy OhMyZSH custom plugin
```sh
mkdir ~/.oh-my-zsh/custom/plugins/cdnvm
cd ~/dotfiles
cp cdnvm.plugin.zsh ~/.oh-my-zsh/custom/plugins/cdnvm/.
```

8. Install VIM plugins
Open any file with `vi` and run `:PlugInstall`


9. Update git config

```sh
vim ~/.gitconfig
```

> Add my name and email

10. Enjoy it!
