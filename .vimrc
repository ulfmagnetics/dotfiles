" JDB vim setup instructions:
" 1. Install pathogen (See https://github.com/tpope/vim-pathogen)
" 2. Clone https://github.com/flazz/vim-colorschemes to
"    ~/.vim/bundle/colorschemes
execute pathogen#infect()
syntax on
filetype plugin indent on
set number

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" remap keys for easier navigation through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme desert
