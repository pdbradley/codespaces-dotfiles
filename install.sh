#!/bin/sh

# recursive copy of .config/ in this repo into the home folder
mkdir -p ~/.config
cp -r .config/* ~/.config

