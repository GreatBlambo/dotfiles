let mapleader = ","

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'felixhummel/setcolors.vim'
Plugin 'vhdirk/vim-cmake'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Configure airline
set laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"Don't create swap files
set noswapfile

"Set color schene
colo triplejelly 

"Set indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

"Set relative numbers
set relativenumber
set number
