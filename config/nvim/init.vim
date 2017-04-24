if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" Point to Python interpreter. This only works if the system has the
" python package "neovim" installed.
let g:python_host_prog='/usr/local/bin/python'

" vim-plug
call plug#begin(s:editor_root . '/plugged')
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'hynek/vim-python-pep8-indent'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'derekwyatt/vim-scala'
Plug 'ap/vim-buftabline'
call plug#end()

"" Visual settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let base16colorspace=256
colorscheme base16-bright

highlight ExtraWhitespace ctermfg=8 ctermbg=0
highlight IncSearch ctermfg=18 ctermbg=12
highlight Search ctermfg=18 ctermbg=12
highlight TabLineSel ctermfg=18 ctermbg=13
highlight PmenuSel ctermfg=19 ctermbg=8

set lazyredraw
set hidden " Allow using multiple unsaved buffers.

set ignorecase
set smartcase
set whichwrap+=<,>,h,l,[,]
set hidden

set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:\ \ ,trail:·

autocmd FileType python setlocal softtabstop=4 shiftwidth=4
autocmd FileType haskell setlocal softtabstop=2 shiftwidth=2

set scrolloff=2 " Set a margin of lines when scrolling.
set backspace=2

"" Status line
set laststatus=2
set statusline=%f       "relative filename
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

"" Behavior
set backupdir=./.backup,.,/tmp

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
inoremap vw <esc>
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

" Quick buffer switching with buftabline.
noremap <Leader>p :bprev<CR>
noremap <Leader>n :bnext<CR>
noremap <Leader><Leader>, <C-^>

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

let g:syntastic_python_checkers = ["pyflakes"]
let g:syntastic_haskell_checkers = ["hdevtools"]
