#!/bin/sh

# -------------------------------------------------------------
#   setup.sh - Setup dev environment 
#   Author: Hoanh An (hoanhan@bennington.edu)
#   Date: 1/13/18
# -------------------------------------------------------------

set -e

if [[ "$(uname -s)" == "Darwin" ]]; then
    echo "Install Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update

    echo "Install macvim"
    brew install macvim --override-system-vim

    echo "Install tmux"
    brew install tmux
else
	sudo apt-get update

    echo "Install macvim"
	sudo apt-get install vim

    echo "Install tmux"
    sudo apt-get install tmux
fi

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copy .vimrc to root directory"
cp "$PWD/.vimrc" ~

echo "Copy .tmux.conf to root directory"
cp "$PWD/.tmux.conf" ~

echo "Install Plugins via Vundle"
vim +PluginInstall +qall

echo "Done"
