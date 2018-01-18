#!/bin/sh

# -------------------------------------------------------------
#   setup.sh - Setup dev environment 
#   Author: Hoanh An (hoanhan@bennington.edu)
#   Date: 1/13/18
# -------------------------------------------------------------

echo "============================================================="
echo "*                    BEGIN INSTALLING                       *"
echo "-------------------------------------------------------------"

echo "-------------------------------------------------------------"
echo "*                 VIM, TMUX & NECESSARY TOOLS               *"
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
    sudo apt-get update
    sudo apt-get install vim
    sudo apt-get install tmux
    sudo apt-get install -y build-essential cmake
    sudo apt-get install -y python-dev python3-dev
    
    sudo apt-get install -y zsh
    sudo chsh ubuntu -s /bin/zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "-------------------------------------------------------------"
echo "*               INSTALL VUNDLE AND BASE PLUGINS             *"
echo "-------------------------------------------------------------"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp "$PWD/.plugins.vim" ~/.vimrc
vim +PluginInstall +qall

echo "-------------------------------------------------------------"
echo "*                     LOAD VIM CONFIGS                      *"
echo "-------------------------------------------------------------"
cp "$PWD/.vimrc" ~

echo "-------------------------------------------------------------"
echo "*                 INSTALL ADDITIONAL CONFIGS                *"
echo "-------------------------------------------------------------"
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

echo "-------------------------------------------------------------"
echo "*                     LOAD TMUX CONFIGS                     *"
echo "-------------------------------------------------------------"
cp "$PWD/.tmux.conf" ~

echo "-------------------------------------------------------------"
echo "*              INSTALL COMPLETE - READY TO USE              *"
echo "============================================================="
