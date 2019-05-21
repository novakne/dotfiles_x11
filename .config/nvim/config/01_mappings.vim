" ~/.config/neovim/config/keybind.vim
" KEYBIND

" Change leader key
let mapleader="\<SPACE>"
" Normal mode with jj 
inoremap jk <esc>
inoremap kj <esc>
" Move updown by visual (wrapped) lines
noremap j gj
noremap k gk
" Easier azerty keys
nnoremap ; .
" Editing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :xa<CR>
nnoremap <Leader>! :q!<CR>
" Append ;/, to the end of the line
nnoremap <silent> <Leader>; :normal A;<CR>
nnoremap <silent> <Leader>, :normal A,<CR>

" WINDOW MANAGEMENT
" Easier window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call util#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call util#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize -1<CR>
nnoremap <silent> <C-Down> :resize +1<CR>

" Tabs
nnoremap <silent> th :tabfirst<CR>
nnoremap <silent> tk :tabnext<CR>
nnoremap <silent> tj :tabprev<CR>
nnoremap <silent> tl :tablast<CR>
nnoremap <silent> tn :tabnew<CR>

" Buffers navigation
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" Clear search results
nnoremap <silent> <esc> :noh<CR>

" Spell
nnoremap <F9> <Esc>:silent setlocal spell! spelllang=en<CR>
nnoremap <F10> <Esc>:silent setlocal spell! spelllang=fr<CR>

" Quickly move current line
nnoremap mm  :<c-u>execute 'move -1-'. v:count1<CR>
nnoremap MM  :<c-u>execute 'move +'. v:count1<CR>

" Terminal
" Split terminal
command! -nargs=* VTerm vsplit | terminal <args>
command! -nargs=* STerm split | terminal <args>
command! -nargs=* TTerm tabnew | terminal <args>

" Get color group name of the syntax group where the cursor is
nnoremap <F12> :call util#SyntaxGroup()<CR> 

" Toggle between number and relativenumber
nnoremap <silent> <Leader>à :call number#ToggleNumber()<CR>

" Serch helpers
nnoremap \s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>
