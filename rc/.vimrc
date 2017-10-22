set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set autoindent
set textwidth=80

set nocompatible

set number

filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'

call vundle#end()

syntax enable
colorscheme inkpot 

let g:airline_theme='kolor'

