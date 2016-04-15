set nocompatible
"" Vundle

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'Twinside/vim-haskellConceal'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'

" Plugin 'Lokaltog/vim-powerline'
" Plugin 'sjl/gundo.vim'
" Plugin 'vim-scripts/vim-javascript'
" Plugin 'othree/html5-syntax.vim'
" Plugin 'nono/vim-handlebars'
" Plugin 'cakebaker/scss-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"" Visual settings
set background=dark
set t_Co=16
colorscheme solarized

set lazyredraw
set hidden " Allow using multiple unsaved buffers.

"" Behavior
syntax on
filetype plugin indent on
set incsearch
set ignorecase
set smartcase
set whichwrap+=<,>,h,l,[,]
set hidden

"" Whitespace
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd FileType python setlocal softtabstop=4 shiftwidth=4
autocmd FileType haskell setlocal softtabstop=2 shiftwidth=2

set scrolloff=2 " Set a margin of lines when scrolling.
set shellcmdflag=-ic
set clipboard=unnamed
set backspace=2

"" Status line
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%l/%L   "cursor line/total lines

"" Wildcards
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.env-pypy
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=.webassets-cache/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=.vagrant/**
set wildignore+=.coverage/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"" Keyboard
let mapleader = ","

"" Key Mappings (Dvorak Layout)

" Unmap unused, frequently accidental, or conflicting commands.
nnoremap <C-z> <Nop>
nnoremap Q <Nop>
nnoremap s <Nop>
nnoremap S <Nop>
try
    unmap <Leader>fc
    unmap <Leader>fef
    unmap <C-f>
catch
endtry

" Use easier key combinations to exit insert mode.
inoremap qj <esc>
inoremap <del> <esc>
nnoremap <del> <esc>

" use d, h, t, n to move left, up, down, and right
noremap d h
noremap D H
noremap h j
noremap H J
noremap gh gj
noremap t k
noremap T K
noremap gt gk
noremap n l
noremap N L

" Reassign the keys we overwrote.
noremap k d
noremap K D
noremap l t
noremap L T
noremap j n
noremap J N

" Use dvorak directions for Netrw (:Explore) buffers too.
augroup netrw_map
  autocmd!
  autocmd filetype netrw call NetrwMap()
augroup END
function! NetrwMap()
  noremap <buffer> d h
  noremap <buffer> D H
  noremap <buffer> h j
  noremap <buffer> H J
  noremap <buffer> gh gj
  noremap <buffer> t k
  noremap <buffer> T K
  noremap <buffer> gt gk
  noremap <buffer> n l
  noremap <buffer> N L
  noremap <buffer> k d
  noremap <buffer> K D
  noremap <buffer> j n
  noremap <buffer> J N
endfunction

" intuitive Y
noremap Y y$

" Press semicolon for command prompt.
nnoremap ; :

" Redo copy and paste mappings.
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP
cmap <C-V> <C-R>+
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Change surround mappings for dvorak.
let g:surround_no_mappings = 1
nmap ks <Plug>Dsurround
nmap cs <Plug>Csurround
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
xmap s  <Plug>VSurround
xmap gs <Plug>VgSurround

" Full text search with ack.vim.
noremap <Leader>f :Ack ''<Left>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" File finding with Ctrl-P.
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_haskell_checkers = ["hdevtools"]

"" vim2hs
let g:haskell_conceal = 0
