#!/bin/sh

# start.sh - Load vim and tmux configurations
# Author: Hoanh An (hoanhan@bennington.edu)
# Date: 04/24/18

echo "Begin the process"

echo "Create git identity"
git config --global credential.helper cache
git config --global user.email "hoanhan@bennington.edu"
git config --global user.name "Hoanh An"

echo "Install Vundle and base plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp "$PWD/.plugins.vim" ~/.vimrc
vim +PluginInstall +qall

echo "Install additional configurations"
cp "$PWD/.vimrc" ~
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

echo "Load tmux configurations"
cp "$PWD/.tmux.conf" ~

echo "Ready to use"
