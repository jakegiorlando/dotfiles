" ~/src/jakegiorlando/dotfiles/.vimrc

"###############
"### GENERAL ###
"###############

" enable syntax highlighting
syntax on

" highlight search
"set hlsearch

" enable auto indent
set autoindent

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

" Ctrl-Y → yank to system clipboard
vnoremap <C-y> "+y

" Ctrl-D → cut (yank + delete) to system clipboard
vnoremap <C-d> "+d

"##################
"### STATUSLINE ###
"##################

" always display statusline
set laststatus=2

" add full file path to statusline
set statusline+=%F

" add date and time to statusline
set statusline+=%=%{strftime('%Y-%m-%d\ %H:%M')}

"###########################################################
"### TOGGLE MOUSE WITH SPACE-M IN NORMAL AND VISUAL MODE ###
"###########################################################

" save toggle state in a file
let s:mouse_state_file = expand('~/.vim_mouse_state')

" restore mouse state at startup
if filereadable(s:mouse_state_file)
    let s:state = get(readfile(s:mouse_state_file, '', 1), 0, '')
    if s:state ==# 'on'
        set mouse=a
    else
        set mouse=
    endif
endif

" toggle mouse and persist state
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

" set mapleader to space
let mapleader=" "

" toggle with space-m in normal and visual mode
nnoremap <Leader>m :call <SID>ToggleMouse()<CR>
xnoremap <Leader>m :<C-u>call <SID>ToggleMouse()<CR>


