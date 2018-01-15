#!/bin/sh

# -------------------------------------------------------------
#   setup.sh - Setup dev environment 
#   Author: Hoanh An (hoanhan@bennington.edu)
#   Date: 1/13/18
# -------------------------------------------------------------

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$(uname -s)" == "Darwin" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install macvim --override-system-vim
    brew install tmux
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp "$DIR/dev-setup/.vimrc" ~
    cp "$DIR/dev-setup/.tmux.conf" ~
	vim +PluginInstall +qall
else
	sudo apt-get update
	sudo apt-get install vim
    sudo apt-get install tmux
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp "$DIR/dev-setup/.vimrc" ~
    cp "$DIR/dev-setup/.tmux.conf" ~
	vim +PluginInstall +qall
fi

echo "Done"
