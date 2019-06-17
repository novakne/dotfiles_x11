" ~/.config/nvim/config/keybind.vim
" KEYBIND

" Change leader key
let mapleader="\<SPACE>"
" Normal mode with jj 
inoremap jk <esc>
inoremap kj <esc>

" Move updown by visual (wrapped) lines
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" Easier start & end of line.
nnoremap H ^
nnoremap L $

" Editing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :q<CR>
nnoremap <Leader>x :xa<CR>
nnoremap <Leader>! :q!<CR>
" Easier azerty keys
nnoremap ; .
" Append ;/, to the end of the line
nnoremap <silent> <Leader>; :normal A;<CR>
nnoremap <silent> <Leader>, :normal A,<CR>

" WINDOW MANAGEMENT
" Move to the split in the direction shown, or create a new split
" ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
nnoremap <silent> <C-h> :call util#WinMove('h')<cr>
nnoremap <silent> <C-j> :call util#WinMove('j')<cr>
nnoremap <silent> <C-k> :call util#WinMove('k')<cr>
nnoremap <silent> <C-l> :call util#WinMove('l')<cr>

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call util#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call util#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize -1<CR>
nnoremap <silent> <C-Down> :resize +1<CR>

" Tabs
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprev<CR>
nnoremap <silent> tn :tabnew<CR>
" Fake zoom, open current file in a new tab 
noremap <silent> tz :tabnew %<CR>

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

" Get color group name of the syntax group where the cursor is
nnoremap <F12> :call util#SyntaxGroup()<CR> 

" Toggle between number and relativenumber
nnoremap <silent> <Leader>à :call number#ToggleNumber()<CR>

" Serch helpers
nnoremap \s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>
