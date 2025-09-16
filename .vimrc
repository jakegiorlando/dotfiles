" syntax highlighting on
syntax on

" highlight search
"set hlsearch

" auto indent
set autoindent

" disable mouse (so selecting with mouse works normally)
"set mouse=

" enable mouse
"set mouse=a

" Toggle mouse on/off with Ctrl-M in normal mode
"nnoremap <C-m> :if &mouse == '' \| set mouse=a \| echo "Mouse ON" \| else \| set mouse= \| echo "Mouse OFF" \| endif<CR>

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

" Save toggle state in a file
let s:mouse_state_file = expand('~/.vim_mouse_state')

" Restore mouse state at startup
if filereadable(s:mouse_state_file)
    let s:state = get(readfile(s:mouse_state_file, '', 1), 0, '')
    if s:state ==# 'on'
        set mouse=a
    else
        set mouse=
    endif
endif

" Toggle mouse and persist state
function! s:ToggleMouse() abort
    if &mouse == ''
        set mouse=a
        echo "Mouse ON"
        call writefile(['on'], s:mouse_state_file)
    else
        set mouse=
        echo "Mouse OFF"
        call writefile(['off'], s:mouse_state_file)
    endif
endfunction

" Toggle with Ctrl-M in normal mode
let mapleader=" "
nnoremap <Leader>m :call <SID>ToggleMouse()<CR>
xnoremap <Leader>m :<C-u>call <SID>ToggleMouse()<CR>

