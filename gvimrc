" set a larger initial size
au GUIEnter * set lines=55 columns=110

" font
set guifont=Inconsolata:h16

" bare bones gui
set guioptions=airL

" right-click menu with copy and paste
behave mswin

" always show tab line
set showtabline=2

" peepopen keybindings
if has("gui_macvim")
	macmenu &File.New\ Tab key=<nop>
	map <leader>f <Plug>PeepOpen
end
