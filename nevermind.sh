#!/bin/sh

# this script will be run by codespaces
# after importing this dotfile repo into a codespace

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
mkdir -p ~/.config
cp -r .config/* ~/.config
#-------------------------------------------------------------
# copy the setup script into homedir bc running it 
# automatically is a nightmare and breaks the codespace setup
cp setupcodespace.sh ~/setupcodespace.sh




# don't know why this line below does not work
sudo chsh -s /usr/bin/zsh $(whoami)

