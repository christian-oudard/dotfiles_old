" set a larger initial size
au GUIEnter * set lines=55 columns=110

" font
set guifont=Inconsolata\ 11

" tabs only in gui
set guioptions=airL

" right-click menu with copy and paste
behave mswin

" always show tab line
set showtabline=2

" mac-specific options
if has("gui_macvim")
	set guifont=Inconsolata:h16
	set guioptions=aeg
	" peepopen keybindings
	map <leader>f <Plug>PeepOpen
end
