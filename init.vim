set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'thisivan/vim-bufexplorer'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" JavaScript and TypeScript plugins
Plug 'pangloss/vim-javascript'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

"Look and Feel plugins
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()

filetype plugin indent on    " required

let mapleader = " "

" Look and Feel settings
set termguicolors
set t_Co=256

syntax enable
colorscheme one
set background=dark

let g:airline_theme='one'
let g:airline_powerline_fonts = 1

" Make terminal background transparent
" (fix for using one-dark colorcheme on Ubuntu)
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Numbers
set number
set numberwidth=4
set ruler

" disable cursor keys in normal mode
map <Left>  :echo "no! use h!"<cr>
map <Down>  :echo "no! use j!"<cr>
map <Up>    :echo "no! use k!"<cr>
map <Right> :echo "no! use l!"<cr>

" Indentation
set autoindent
set cindent
set smartindent

" Tab Options
set shiftwidth=2
set tabstop=2
set expandtab

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" set correct filetypes for various languages
au BufRead,BufNewFile *.js set filetype=javascript

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" Ack vim
let g:ackprg="ack -H --nocolor --nogroup --column  --ignore-dir={vendor,node_modules,bower_components,dist,.git,.tmp}"

" ALE TypeScript autocomplete
let g:ale_completion_enabled = 1

" Shortcuts
nnoremap <silent><leader>l :BufExplorer<CR>
nnoremap <silent><leader>k :Explore<CR>
nnoremap <silent><leader>s :A<CR>
nnoremap <silent><leader>v :AV<CR>
nnoremap <silent><leader>\ :vs<CR>
nnoremap <silent><leader>- :split<CR>

" Ignore directories when using ctrl-p
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|gulp\|git'

" Break HTML attributes into separate lines
map <F4> :'<,'>s/\"\s/\"\r/g<CR>
