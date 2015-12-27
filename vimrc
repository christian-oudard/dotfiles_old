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

"" Appearance
set background=light
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
set tabstop=8
set softtabstop=2
set expandtab
set shiftwidth=2
set foldmethod=manual

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

" Change surround mappings for dvorak.
let g:surround_no_mappings = 1
nmap ks <Plug>Dsurround
nmap cs <Plug>Csurround
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
xmap s  <Plug>VSurround
xmap gs <Plug>VgSurround

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_haskell_checkers = ["hdevtools"]

"" vim2hs
let g:haskell_conceal = 0
