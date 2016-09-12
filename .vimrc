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
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on
" End Vundle-managed plugin setup

" set basic options
set number
syntax on
colorscheme desert

" Indent with two spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" set up CtrlP (fuzzy finder)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" set up EasyGrep
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepFilesToExclude = "*.swc,*.swp,*.git,tags,*.log,tmp/*"
let g:EasyGrepRecursive = 1
" use The Silver Searcher (ag) if available
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
elseif executable('ack')
  set grepprg=ack\ -s\ --nogroup\ --nocolor\ --column\ --with-filename
endif

" set up vim-rspec
let g:rspec_command = "bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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

" set up status line
set statusline=%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %{ObsessionStatus()}
