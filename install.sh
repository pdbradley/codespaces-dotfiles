#!/bin/sh

# this script will be run by codespaces
# after importing this dotfile repo into a codespace

# basically copying the dotfiles within this repo
# putting them in the right place in the codespace

cp -r .config/* ~/.config
