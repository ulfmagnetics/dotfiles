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

colorscheme desert
