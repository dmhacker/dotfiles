" Use 2 as the default spacing for tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

" Proper indenting
set autoindent
set smartindent

" Set line size to be 80 (extra characters in a line are marked as errors)
set textwidth=80
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\%81v.\+/

" Disable turning off vim and defaulting to vi
set nocompatible

" Enable line numbers on the left hand side
set number

" Vundle magic/plugins begin here
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'dietsche/vim-lastplace'

call vundle#end()

" Enable syntax highlighting and use colorscheme
syntax enable
colorscheme jelleybeans 

" Enable ARM syntax highlighting
au BufNewFile,BufRead *.s *.S set filetype=arm " arm = armv6/7

" Set our airline theme
let g:airline_theme = 'jellybeans'

" Set file types to ignore for vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Set buffer types to ignore for vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
