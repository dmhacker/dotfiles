" File type, plugin detection  
filetype plugin indent on

" Encoding must be UTF-8 on all files for YCM to work 
set encoding=utf-8

" Set global indenting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround
set autoindent

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

" Default vim folding (exclude python, latex)
au BufNewFile,BufRead * 
      \ if &ft != "python" && &ft != "latex" && &ft != "tex"
      \ | set foldmethod=syntax foldnestmax=10 foldlevel=2 | endif 

" Remap leader key
let mapleader=','

" Remap copy and paste registers
vnoremap <C-c> "+y
noremap <C-v> "+p

" Alternative way to get out of normal mode 
inoremap kj <Esc>
inoremap jk <Esc>

" Vundle magic/plugins begin here
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vundle package manager 

Plugin 'itchyny/lightline.vim' " Status line at the bottom 

" http://colorswat.ch/vim/
" Plugin 'chriskempson/base16-vim'
Plugin 'danielwe/base16-vim' " Use fork of base16 to fix a:dict issues 
Plugin 'daviesjamie/vim-base16-lightline'
" Plugin 'nanotech/jellybeans.vim'

Plugin 'godlygeek/tabular' " Markdown dependency
Plugin 'sheerun/vim-polyglot' " Syntax highlighting for many languages 
Plugin 'vim-latex/vim-latex' " LaTeX suite 
Plugin 'maxmellon/vim-jsx-pretty' " JSX syntax highlighting

Plugin 'Valloric/YouCompleteMe' " Fast autocompletion engine
Plugin 'rdnetto/YCM-Generator' " Generates C-semantic files for projects

Plugin 'vim-syntastic/syntastic'
Plugin 'tmhedberg/SimpylFold' " Better Python folding
Plugin 'kien/ctrlp.vim' " File search engine 

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
" Disable unnecessary language highlighting
let g:polyglot_disabled = ['jsx']

" C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" Python highlighting
let python_highlight_all = 1

" Markdown highlighting 
let g:vim_markdown_json_frontmatter = 1

" GraphQL highlighting
let g:graphql_javascript_tags = ["gql", "graphql", "Relay.QL"]

" i3config highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Autocompletion options 
" let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_confirm_extra_conf = 0 
let g:ycm_disable_for_files_larger_than_kb = 5000
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-P>', '<Up>']

" Preview docstrings for folded code
let g:SimpylFold_docstring_preview = 1

" Sneak labels which lines to we are looking at 
let g:sneak#label = 1

" Set file types to ignore for vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Set buffer types to ignore for vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Set vim-latex to output pdfs by default
let g:Tex_DefaultTargetFormat = "pdf"

