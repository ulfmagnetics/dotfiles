" Begin Vundle-managed plugin setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required!
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'craigemery/vim-autotag'
Plugin 'dkprice/vim-easygrep'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()
filetype plugin indent on
" End Vundle-managed plugin setup

" set basic options
set number
syntax on

" Indent with two spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" set up CtrlP (fuzzy finder)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" autocomplete parens, curly braces, and square braces
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

" remap keys for easier navigation through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme desert
