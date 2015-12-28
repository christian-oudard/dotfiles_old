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

" All of your Plugins must be added before the following line
call vundle#end()            " required

set background=dark
set t_Co=16
colorscheme solarized
set lazyredraw
set hidden " Allow using multiple unsaved buffers.

syntax on
filetype plugin indent on	
set incsearch
set ignorecase
set smartcase
set whichwrap+=<,>,h,l,[,]
set hidden
set tabstop=8
set softtabstop=2
set expandtab
set shiftwidth=2
set scrolloff=2 " Set a margin of lines when scrolling.
set shellcmdflag=-ic
set clipboard=unnamed
set backspace=2

autocmd FileType python setlocal shiftwidth=2 softtabstop=2 

set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines

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


"" Key Mappings (Dvorak Layout) """

" Unmap unused, frequently accidental, or conflicting commands.
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

" Full text search
noremap <Leader>f :Ag ''<Left>

"" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_haskell_checkers = ["hdevtools"]

"" vim2hs
let g:haskell_conceal = 0
