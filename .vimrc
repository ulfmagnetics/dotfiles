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
Plugin 'dkprice/vim-easygrep'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tomlion/vim-solidity'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tmhedberg/matchit'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dadbod'
Plugin 'elixir-editors/vim-elixir'
Plugin 'yssl/QFEnter'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on
" End Vundle-managed plugin setup

" set basic options
set number
set splitright
set splitbelow
set laststatus=2 " always display status line
set nofoldenable " don't fold by default; use 'zi' to turn it on
set foldmethod=indent
set autoread
syntax on
colorscheme Monokai
set guifont=Menlo\ Regular:h10

" Indent with two spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" highline current line with \c
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=DimGray guifg=NONE
:nnoremap <Leader>c :set cursorline!<CR>

" set up vim-textobj-rubyblock
runtime macros/matchit.vim

" set up NERDTree (file system explorer)
map <Leader>r :NERDTreeFind<cr>

" set up CtrlP (fuzzy finder)
set runtimepath^=~/.vim/bundle/ctrlp.vim
cnoremap %methapp <c-r>=expand('~/src/MethodologyDev/Methodology')<cr>
cnoremap %methclient <c-r>=expand('~/src/MethodologyDev/methodology-client')<cr>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = 'node_modules'
map <Leader>p :CtrlPBuffer<CR>

" working with ctags:
set tags^=~/src/MethodologyDev/Methodology/.git/tags
" quick search through tags
nnoremap <Leader>. :CtrlPTag<cr>
" toggle the tagbar
nnoremap <silent> <Leader>b :TagbarToggle<cr>
" open ctag in vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" switch all windows/splits to cwd of current file
nnoremap <leader>cd :cd %:p:h<CR>

" set up EasyGrep
let g:EasyGrepCommand = 1
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepFilesToExclude = "*.swc,*.swp,*.git,tags,*.log,tmp/*,node_modules/*"
let g:EasyGrepRecursive = 1
let g:EasyGrepRoot = "repository"
" use The Silver Searcher (ag) if available
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-ignore ~/.agignore -g ""'

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

" set up markdown preview
let vim_markdown_preview_hotkey='<C-@>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_github=1

" Javascript dev setup
let g:jsx_ext_required = 0
au BufNewFile,BufRead *.ejs set filetype=html

" Clojure dev setup
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
au VimEnter * RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" autocomplete parens, curly braces, and square braces
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap [ []<Esc>i

" remap keys for easier navigation through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set up status line
set statusline=%m\ %f
set statusline+=\ %{fugitive#statusline()}
set statusline+=%{ObsessionStatus()}

" set up fugitive (git wrapper)
autocmd QuickFixCmdPost *grep* cwindow

" set up QFEnter (quickfix window splits)
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" find files and populate the quickfix list
" from http://vim.wikia.com/wiki/Searching_for_files
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)
