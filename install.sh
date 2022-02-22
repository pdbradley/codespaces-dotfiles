#!/bin/sh

# this script will be run by codespaces
# after importing this dotfile repo into a codespace

# tmux and neovim
sudo apt-get install -y tmux
sudo apt-get install -y neovim

# install neovim plugin manager.  dotfiles will be imported via personal codespace settings
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# install ripgrep and fzf and ag (nvim uses them)
sudo apt-get install -y ripgrep
sudo apt-get install -y fzf
sudo apt-get install -y silversearcher-ag

#-------------------------------------------------------------
# basically copying the dotfiles within the root of this repo
# putting them in the home dir in the codespace
create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}
create_symlinks
#-------------------------------------------------------------
# recursive copy of .config/ in this repo into the home folder
cp -r .config/* ~/.config
#-------------------------------------------------------------

# install all the plugins in neovim and quit
nvim +PlugInstall +qall

# install zsh
# the yes is to get past a warning related to an existing file in /etc 
yes | sudo apt-get install zsh
# install oh my zsh
rm -rf "$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#copy my custom oh my zsh stuff
cp -r .config/oh-my-zsh/* ~/.oh-my-zsh

# don't know why this line below does not work
# sudo chsh -s /usr/bin/zsh $USERNAME
sudo chsh -s /usr/bin/zsh codespace

