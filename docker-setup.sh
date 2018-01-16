#!/bin/sh

# -------------------------------------------------------------
#   docker-setup.sh - Same as setup.sh, wihout using sudo 
#   Author: Hoanh An (hoanhan@bennington.edu)
#   Date: 1/13/18
# -------------------------------------------------------------

echo "============================================================="
echo "*                    BEGIN INSTALLING                       *"
echo "-------------------------------------------------------------"

echo "-------------------------------------------------------------"
echo "*                       VIM & TMUX                          *"
echo "-------------------------------------------------------------"

set -e

if [ "$(uname -s)" == "Darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install macvim --override-system-vim
    brew install tmux
    brew install cmake
    brew install python3
else
    apt-get update
    apt-get install vim
    apt-get install tmux
    apt-get install -y build-essential cmake
    apt-get install -y python-dev python3-dev
fi

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
