""" Behavior """

" settings
syntax on
set incsearch
set ignorecase
set hidden
set linebreak
set showbreak=> 
set tags=tags;~/devel/
set smarttab

" do tab completion for file names more like bash
set wildmode=longest,list,full
set wildmenu


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
autocmd FileType ruby set ts=2 sw=2 et
autocmd FileType html,htmldjango,xhtml,xml,css,javascript set ts=2 sw=2 noet

" remove trailing whitespace on save
function RemoveTrailingWhitespace()
	:call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
:endfunction
autocmd FileType c,cpp,java,php,python,ruby,html,htmldjango,xhtml,xml,css,javascript 
			\autocmd BufWritePre <buffer> :call RemoveTrailingWhitespace()

""" Key Mappings """

" press v w to exit instead of escape 
imap vw <esc>

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
noremap <C-d> :bd<cr>
