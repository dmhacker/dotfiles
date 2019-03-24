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

" Increase register buffer size
set viminfo='50,<1000,s1000,h

" Remap leader key
let mapleader=','

" Remap copy and paste registers
vnoremap <C-c> "+y
noremap <C-v> "+p

" Alternative way to get out of normal mode 
inoremap kj <Esc>
inoremap jk <Esc>

" Vundle magic/plugins begin here
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vundle package manager 

Plugin 'itchyny/lightline.vim' " Responsible for bottom info bar

" http://colorswat.ch/vim/
" Plugin 'chriskempson/base16-vim'
Plugin 'danielwe/base16-vim' " Use fork of base16 to fix a:dict issues 
Plugin 'daviesjamie/vim-base16-lightline'
" Plugin 'nanotech/jellybeans.vim'

Plugin 'vim-latex/vim-latex' " LaTeX suite for vim 
Plugin 'vim-jp/vim-cpp' " C++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight' " C++ syntax highlighting
Plugin 'pboettch/vim-cmake-syntax' " CMake syntax highlighting
Plugin 'rust-lang/rust.vim' " Rust syntax highlighting
Plugin 'vim-python/python-syntax' " Python syntax highlighting
Plugin 'pangloss/vim-javascript' " JS syntax highlighting
Plugin 'maxmellon/vim-jsx-pretty' " JSX syntax highlighting
Plugin 'elzr/vim-json' " JSON syntax highlighting
Plugin 'godlygeek/tabular' " Markdown dependency
Plugin 'plasticboy/vim-markdown' " Markdown file highlighting
Plugin 'mboughaba/i3config.vim' " i3 config highlighting

Plugin 'tpope/vim-fugitive' " Git integration for vim
Plugin 'airblade/vim-gitgutter' " Git marks in the gutter 
Plugin 'kshenoy/vim-signature' " Vim marks in the gutter 

Plugin 'tpope/vim-surround' " Mappings to edit parentheses, brackets, etc.
Plugin 'tpope/vim-commentary' " Fast commenting
Plugin 'justinmk/vim-sneak' " Fast file jumping
Plugin 'dietsche/vim-lastplace' " Saves last edit line for a file

call vundle#end()

" Enable syntax highlighting and use colorscheme
set background=dark
syntax enable 
set termguicolors
colorscheme base16-default-dark 
" colorscheme jellybeans

" Enable lightline status and use colorscheme
set laststatus=2
let g:lightline = { 'colorscheme': 'base16', }
" let g:lightline = { 'colorscheme': 'jellybeans', }

" C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

" Python highlighting
let python_highlight_all = 1

" Markdown highlighting 
let g:vim_markdown_json_frontmatter = 1

" i3 config highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Sneak labels which lines to we are looking at 
let g:sneak#label = 1

" Set file types to ignore for vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Set buffer types to ignore for vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Set vim-latex to output pdfs by default
let g:Tex_DefaultTargetFormat = "pdf"
