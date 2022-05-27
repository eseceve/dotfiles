# DotFiles

Backup of configuration files for my development environment

## Usage

1. Install Iterm 2

    [Download it from the official webpage][iterm-link] and install it

2. Install Oh-My-ZSH

    Follow [the official instructions][ohmyzsh-link]

3. Install [brew][brew-link] apps

    ```sh
    brew install autojump gettext git git-extras node tmux vim
    ````

4. Install NVM

    Prefer install it following
    [this official instructions][nvm-link]
    instead of use Brew to avoid weird behaviors

5. Clone this repository

    > Make sure you have [configured your github account][github-account-link]

    ```sh
    cd ~
    git clone git@github.com:eseceve/dotfiles.git
    ```

6. Copy your dotfiles

    ```sh
    cd ~/dotfiles
    ./copy-files.sh
    ```

7. Update Iterm profile:
    1. Open the Iterm's preferences (`cmd + ,`)
    2. Go to `Profiles` tab
    3. Import the `~/Documents/itermProfile.json` from `Other actions` selector below your lists of profiles
    4. Set "DotFiles profile" as default profile from the same selector

8. Install VIM plugins

    Open any file with `vi` and run `:PlugInstall`

9. Enjoy it!

[brew-link]:https://brew.sh
[github-account-link]:https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
[iterm-link]:https://iterm2.com/downloads.html
[nvm-link]:https://github.com/nvm-sh/nvm#installing-and-updating
[ohmyzsh-link]:https://github.com/ohmyzsh/ohmyzsh#basic-installation
