" Use 2 as the default spacing for tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

" Proper indenting
set autoindent
set smartindent

" Set line size to be 80 and highlight column at line 80
" set textwidth=80
" set colorcolumn=81

" Disable turning off vim and defaulting to vi
set nocompatible

" Enable line numbers on the left hand side
set relativenumber

" Highlight current line
set cursorline

" Remap leader key
let mapleader=','

" Remap copy and paste registers
vnoremap <C-c> "+y
noremap <C-v> "+p

" Vundle magic/plugins begin here
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vundle package manager 

" http://colorswat.ch/vim/
Plugin 'arcticicestudio/nord-vim' " Colorscheme 
Plugin 'itchyny/lightline.vim' " Airline at the bottom of the screen

Plugin 'ARM9/arm-syntax-vim' " ARM syntax hightlighting
Plugin 'octol/vim-cpp-enhanced-highlight' " C++ syntax highlighting
Plugin 'pangloss/vim-javascript' " JavaScript syntax highlighting
Plugin 'mxw/vim-jsx' " JSX syntax highlighting
Plugin 'vim-latex/vim-latex' " LaTeX suite for vim 

Plugin 'tpope/vim-fugitive' " Git integration for vim
Plugin 'airblade/vim-gitgutter' " Git marks in the gutter 
Plugin 'kshenoy/vim-signature' " Vim marks in the gutter 

Plugin 'tpope/vim-surround' " Mappings to edit parentheses, brackets, etc.
Plugin 'tpope/vim-commentary' " Fast commenting
Plugin 'justinmk/vim-sneak' " Fast file jumping
Plugin 'dietsche/vim-lastplace' " Saves last edit line for a file

call vundle#end()

" Enable syntax highlighting and use colorscheme
syntax enable 
colorscheme nord 

" Enable lightline status and use colorscheme
set laststatus=2
let g:lightline = { 'colorscheme': 'nord', }

" Enable ARM syntax highlighting
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

" Enable C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" Sneak labels which lines to we are looking at 
let g:sneak#label = 1

" Set file types to ignore for vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Set buffer types to ignore for vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
