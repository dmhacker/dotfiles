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
" set textwidth=80
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\%81v.\+/

" Disable turning off vim and defaulting to vi
set nocompatible

" Enable line numbers on the left hand side
set number

" Highlight current line
set cursorline

" Vundle magic/plugins begin here
filetype plugin indent on

" Remap leader key
let mapleader=","

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

Plugin 'tpope/vim-fugitive' " Git integration for vim
Plugin 'airblade/vim-gitgutter' " Git marks in the gutter 
Plugin 'kshenoy/vim-signature' " Vim marks in the gutter 

Plugin 'scrooloose/nerdcommenter' " Fast commenting
Plugin 'tpope/vim-surround' " Mappings to edit parentheses, brackets, etc.
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

" Add spaces after comment delimiters
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1

" Enale trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Sneak labels which lines to we are looking at 
let g:sneak#label = 1

" Set file types to ignore for vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Set buffer types to ignore for vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
