"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   plugins.vim - Base plugins for Vundle 
"   Author: Hoanh An (hoanhan@bennington.edu)
"   Date: 1/13/17 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle - Plugins/Bundles Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" List of plugins and bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of the plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
