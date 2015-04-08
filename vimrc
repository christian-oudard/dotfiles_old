execute pathogen#infect()

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
set softtabstop=4
set expandtab
set shiftwidth=4

"" Keyboard
let mapleader = ","

" Press semicolon for command prompt.
nnoremap ; :

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_haskell_checkers = ["hdevtools"]
