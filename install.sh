#!/bin/sh

# this script will be run by codespaces
# after importing this dotfile repo into a codespace


# tmux and neovim
apt install -y tmux
apt install -y neovim

# install neovim plugin manager.  dotfiles will be imported via personal codespace settings
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# install ripgrep and fzf and ag (nvim uses them)
apt install -y ripgrep
apt install -y fzf
apt install -y silversearcher-ag

# basically copying the dotfiles within this repo
# putting them in the right place in the codespace
cp -r .config/* ~/.config


# install all the plugins in neovim and quit
nvim +PlugInstall +qall
