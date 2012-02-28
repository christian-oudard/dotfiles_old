" set a larger initial size
au GUIEnter * set lines=55 columns=110

" font
set guifont=Inconsolata:h16

" tabs only in gui
set guioptions=aeg

" right-click menu with copy and paste
behave mswin

" always show tab line
set showtabline=2

" peepopen keybindings
if has("gui_macvim")
	map <leader>f <Plug>PeepOpen
end
