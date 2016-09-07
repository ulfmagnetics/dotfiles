" JDB vim setup instructions:
" 1. Install pathogen (See https://github.com/tpope/vim-pathogen)
" 2. Clone https://github.com/flazz/vim-colorschemes to
"    ~/.vim/bundle/colorschemes
" 3. Clone https://github.com/ctrlpvim/ctrlp.vim.git to
"    ~/.vim/bundle/ctrlp.vim

execute pathogen#infect()

" set basic options
set nocompatible
set number
syntax on
filetype plugin indent on

" Indent with two spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" set up CtrlP (fuzzy finder)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" remap keys for easier navigation through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme desert
