" syntax highlighting on
syntax on

" highlight search
"set hlsearch

" auto indent
set autoindent

" disable mouse (so selecting with mouse works normally)
"set mouse=

" enable mouse
set mouse=a

" scroll wheel one line at a time in normal mode
noremap <ScrollWheelUp> k
noremap <ScrollWheelDown> j

" enable line wrapping
set wrap

" keep wrapped lines visually indented
set breakindent

" don't break words when wrapping
set linebreak

" chracters to break on
set breakat=\ \ ;:,!?

" clipboard syncs with system
"set clipboard=unnamedplus

" clipboard syncs with system - macos only
"set clipboard=unnamed

" Ctrl-Y → yank to system clipboard
vnoremap <C-y> "+y

" Ctrl-D → cut (yank + delete) to system clipboard
vnoremap <C-d> "+d
