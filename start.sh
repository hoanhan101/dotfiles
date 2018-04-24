#!/bin/sh

# start.sh - Load vim and tmux configurations
# Author: Hoanh An (hoanhan@bennington.edu)
# Date: 04/24/18

echo "============================================================="
echo "*                    BEGIN INSTALLING                       *"
echo "-------------------------------------------------------------"

echo "-------------------------------------------------------------"
echo "*                        VUNDLE                             *"
echo "-------------------------------------------------------------"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "-------------------------------------------------------------"
echo "*                LOAD BASE PLUGINS TO .VIMRC                 *"
echo "-------------------------------------------------------------"
cp "$PWD/.plugins.vim" ~/.vimrc

echo "-------------------------------------------------------------"
echo "*                 INSTALL PLUGINS VIA VUNDLE                *"
echo "-------------------------------------------------------------"
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

echo "-------------------------------------------------------------"
echo "*                     LOAD VIM CONFIGS                      *"
echo "-------------------------------------------------------------"
cp "$PWD/.vimrc" ~

echo "-------------------------------------------------------------"
echo "*                     LOAD TMUX CONFIGS                     *"
echo "-------------------------------------------------------------"
cp "$PWD/.tmux.conf" ~

echo "-------------------------------------------------------------"
echo "*              INSTALL COMPLETE - READY TO USE              *"
echo "============================================================="
