""" Appearance """

set t_Co=256
set background=dark
set cursorline
unlet! g:zenburn_high_Contrast
unlet! g:zenburn_alternate_Visual
unlet! g:zenburn_alternate_Error
let g:zenburn_alternate_Include = 1
colorscheme zenburn


""" Behavior """

syntax on " use syntax highlighting
set nocompatible " don't limit to vi-compatible features
set incsearch " search as you type
set ignorecase " case insensitive search
set hidden " allow using multiple buffers
set linebreak " wrap long lines
set showbreak=> " show line wrapping with a > character
set tags=tags " specify tag file name
set smarttab
set scrolloff=3 " set a margin of lines when scrolling
set virtualedit=block " free roaming cursor in block mode

" do tab completion for file names more like bash
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc,*.pyo,.svn,.git,.bzr,*.o,*~


""" Indentation and Syntax """

" indentation plugin, settings in ~/.vim/indent/
filetype plugin indent on

" default indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

" filetype plugin
filetype on

" file types
autocmd FileType python set ts=4 sw=4 et
autocmd FileType ruby,scala set ts=2 sw=2 et
autocmd FileType html,htmldjango,xhtml,xml,css,javascript set ts=2 sw=2 noet

" remove trailing whitespace on save
function! RemoveTrailingWhitespace()
	:call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
:endfunction
autocmd FileType c,cpp,java,php,python,ruby,html,htmldjango,xhtml,xml,css,javascript 
			\autocmd BufWritePre <buffer> :call RemoveTrailingWhitespace()


""" Key Mappings (Dvorak Layout) """

" press v w to exit instead of escape
imap vw <esc>

" use d, h, t, n to move left, up, down, and right
noremap d h
noremap D H
noremap h j
noremap H J
noremap gh gj
noremap t k
"noremap T K
noremap gt gk
noremap n l
noremap N L

" reassign the keys we overwrote
noremap k d
noremap K D
noremap l t
noremap L T
noremap j n
noremap J N

" intuitive Y
noremap Y y$

" remap tag functions
noremap T <C-]>
noremap gj g]

" quick buffer switching
noremap <C-s> :b#<cr>
noremap <C-n> :bn<cr>
noremap <C-p> :bp<cr>
noremap <C-d> :bd<cr>


""" Plugins """

" use comma as leader key for custom bindings
let mapleader = ","
let g:mapleader = ","

" fuzzy finder
map <leader>f :FuzzyFinderTextMate<CR>
let g:fuzzy_ceiling = 20000 " max results
let g:fuzzy_path_display = 'highlighted_path' " show full paths
let g:fuzzy_ignore = "*.pyc;*.pyo;*.o;.svn/**;.git/**;.bzr/**;*.png;*.PNG;*.jpg;*.JPG;*.gif;*.GIF"

" surround
let g:surround_no_mappings = 1
nmap ks <Plug>Dsurround
nmap cs <Plug>Csurround
nmap ys <Plug>Ysurround
nmap yS <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
vmap s <Plug>Vsurround
vmap S <Plug>VSurround
imap <C-S> <Plug>Isurround
