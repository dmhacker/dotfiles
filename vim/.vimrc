" File type, plugin detection  
filetype plugin indent on

" Encoding must be UTF-8 on all files for YCM to work 
set encoding=utf-8

" Set global indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent

" Set indenting for frontend development 
aug fullstack_ft_indenting
au!
au BufNewFile,BufRead *.js,*.html,*.css
            \ set tabstop=2 softtabstop=2 shiftwidth=2
aug end

" Disable turning off vim and defaulting to vi
set nocompatible

" Increase register buffer size
set viminfo='50,<1000,s1000,h

" Remap leader keys
let mapleader=','
let maplocalleader=';'

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

Plugin 'nanotech/jellybeans.vim' " Classic Jellybeans colorscheme

Plugin 'godlygeek/tabular' " Markdown dependency
Plugin 'sheerun/vim-polyglot' " Syntax highlighting for many languages 
Plugin 'lervag/vimtex' " LaTeX suite 
Plugin 'maxmellon/vim-jsx-pretty' " JSX syntax highlighting

" IMPORTANT: these require external dependencies to work  
Plugin 'Valloric/YouCompleteMe' " Fast autocompletion engine
Plugin 'rdnetto/YCM-Generator' " Generates C-semantic files for projects
Plugin 'w0rp/ale' " Code linting, syntax checking
Plugin 'Chiel92/vim-autoformat' " Proper auto-formatting
Plugin 'majutsushi/tagbar' " Tagbar for viewing functions in file

Plugin 'maximbaz/lightline-ale' " Lightline integration for linter 
Plugin 'nathanaelkane/vim-indent-guides' " Add visual indent guides 
Plugin 'tpope/vim-fugitive' " Git integration for vim
Plugin 'airblade/vim-gitgutter' " Git marks in the gutter 
Plugin 'kshenoy/vim-signature' " Vim marks in the gutter 
Plugin 'jeffkreeftmeijer/vim-numbertoggle' " Hybrid mode for numbers

Plugin 'ctrlpvim/ctrlp.vim' " File search engine 
Plugin 'wincent/terminus' " Enable mouse, change cursor mode, etc. 
Plugin 'tpope/vim-surround' " Mappings to edit parentheses, brackets, etc.
Plugin 'tpope/vim-commentary' " Fast commenting
Plugin 'justinmk/vim-sneak' " Fast file jumping
Plugin 'dietsche/vim-lastplace' " Saves last edit line for a file
Plugin 'terryma/vim-multiple-cursors' " Start up multiple cursors

call vundle#end()

" Enable syntax highlighting and use colorscheme
set background=dark
set termguicolors
syntax enable 
colorscheme jellybeans

" Enable lightline status and use colorscheme
set laststatus=2
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
let g:lightline = { 'colorscheme': 'jellybeans', }
let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
    \     'linter_checking': 'left',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left',
    \ }
let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ }
let g:lightline.active = { 
\    'left': [[ 'mode', 'paste' ], [ 'filename' ], [ 'modified', 'readonly' ]],
\    'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'percent' ], ['lineinfo']] 
\ }

" Disable unnecessary language highlighting
let g:polyglot_disabled = ['jsx', 'latex']

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

" Disable default vim indenting
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
nmap <Leader>f :Autoformat<CR>

" Autocompletion options 
" let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_confirm_extra_conf = 0 
let g:ycm_disable_for_files_larger_than_kb = 5000
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-P>', '<Up>']

" Linting options
let g:ale_completion_enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_delay = 1500

" Indent guide settings
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Open tagbar easily 
nmap <Leader>t :TagbarToggle<CR>

" Sneak labels which lines to we are looking at 
let g:sneak#label = 1

" Set file types to ignore for vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Set buffer types to ignore for vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Set vimtex to use my viewer and compiler of choice
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexrun'

" Enable hybrid mode for vim line numbres
set number relativenumber

" Bold current line number
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
se cursorline
