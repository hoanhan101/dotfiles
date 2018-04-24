#!/bin/sh

# start.sh - Load vim and tmux configurations
# Author: Hoanh An (hoanhan@bennington.edu)
# Date: 04/24/18

echo "Begin the process"

echo "Clone VundleVim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Load base plugins to .vimrc"
cp "$PWD/.plugins.vim" ~/.vimrc

echo "Install plugins via vundle"
vim +PluginInstall +qall

echo "Load vim configurations"
cp "$PWD/.vimrc" ~

echo "Load tmux configurations"
cp "$PWD/.tmux.conf" ~

echo "Ready to use"
