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

"" Keyboard
let mapleader = ","

" Press semicolon for command prompt.
nnoremap ; :
