#!/bin/sh

# tmux and neovim
sudo apt-get install -y tmux
sudo apt-get install -y neovim

# install neovim plugin manager.  dotfiles will be imported via personal codespace settings
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install ripgrep and fzf and ag (nvim uses them)
sudo apt-get install -y ripgrep
sudo apt-get install -y fzf
sudo apt-get install -y silversearcher-ag

# install all the plugins in neovim and quit
nvim +PlugInstall +qall

# install zsh
# the yes is to get past a warning related to an existing file in /etc 
sudo cp /etc/zsh/zlogin /etc/zsh/zlogin.original
yes | sudo apt-get install zsh
sudo cp /etc/zsh/zlogin.original /etc/zsh/zlogin

# install oh my zsh
rm -rf "$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#copy my custom oh my zsh stuff
cp -r .config/oh-my-zsh/* ~/.oh-my-zsh
