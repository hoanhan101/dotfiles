#!/bin/sh

# start.sh - Load configurations to a Docker image
# Author: Hoanh An (hoanhan@bennington.edu)
# Date: 04/24/18

# Cyan '=>' symbol
SYMBOL='\033[0;36m=>\033[0m'

echo "${SYMBOL} Create git identity"
git config --global credential.helper cache
git config --global user.email "hoanhan@bennington.edu"
git config --system user.email "hoanhan@bennington.edu"
git config --local user.email "hoanhan@bennington.edu"
git config --global user.name "Hoanh An"
git config --system user.name "Hoanh An"
git config --local user.name "Hoanh An"

echo "${SYMBOL} Install Vundle and base plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp "$PWD/.plugins.vim" ~/.vimrc
vim +PluginInstall +qall

echo "${SYMBOL} Install additional configurations"
cp "$PWD/.vimrc" ~
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

echo "${SYMBOL} Load tmux configurations"
cp "$PWD/.tmux.conf" ~

echo "${SYMBOL} Install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "${SYMBOL} Load oh my zsh configurations"
cat <<EOT >> ~/.zshrc
# ls every cd
function chpwd() {
    emulate -L zsh
    ls -a
}
EOT

echo "${SYMBOL} Clone the github repo itself"
git clone https://github.com/hoanhan101/dev-setup.git
