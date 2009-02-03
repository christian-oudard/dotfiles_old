" indentation plugin, settings in ~/.vim/indent/
filetype plugin indent on

" press v w to exit instead of escape 
imap vw <esc>

" settings
syntax on
set incsearch
set ignorecase
set hidden
set linebreak
set showbreak=> 
set tags=tags;~/devel/

" filetype plugin
filetype on

" file types
autocmd FileType python set ts=4 sw=4 et
autocmd FileType ruby set ts=2 sw=2 et
autocmd FileType html,htmldjango,xhtml,xml,css,javascript set ts=2 sw=2 noet

" remap movement keys for dvorak layout
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

