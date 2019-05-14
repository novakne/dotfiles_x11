" ~/.config/nvim/init.vim
" NVIM 

" GENERAL
" Show line number
set number
" Always 5 lines under cursor
set scrolloff=5
" No swap / backup file
set noswapfile
set nobackup
" Enables to switch between unsaved buffers and keep undo history
set hidden
" Don't insert line breaks in the middle of a word
set linebreak
" Use 4 spaces instead of tab
" Copy indent from current line when starting a new line
set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" Puts new split windows to the bottom of the current
set splitbelow
" Puts new vsplit windows to the right of the current
set splitright
" Use the clipboard for all operations
set clipboard+=unnamedplus
" Make backspace work like most other programs
set backspace=indent,eol,start
" Show preview of substitute command
set inccommand=nosplit
" Enable mouse
set mouse=a
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Use python 3
set pyxversion=3
" Dont select newline in visual mode ( v$ )
set selection=exclusive

" COMPLETION ( :help 'complete' )
" Enhanced cmd line completion
set wildmenu
" Key for line completion
set wildchar=<TAB>
" Ignore case when completing file and directory
set wildignorecase

" SEARCH
" Highlight search results
set hlsearch
" Search whilst typing
set incsearch
" Case insensitive searching
set ignorecase
" Override ignorecase if upper case typed
set smartcase
" Stop in list
set more

" NETRW
" Tree view
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" Open files ( 1 horizontal 2 Vertical 3 New tab 4 Previous window )
let g:netrw_browse_split = 4
" Width of the directory explorer
let g:netrw_winsize = 25
" Right splitting
let g:netrw_altv = 1
" Automatically kill phantom buffers created by netrw 
" Close if netrw / quickfix is the last window
augroup CleanNetrw
    autocmd!
    autocmd FileType netrw setlocal bufhidden=delete
    autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
    nmap - :Lexplore<cr>
augroup END

" THEME {{{
set termguicolors
set noshowmode
set noshowcmd
" Transparent popupmenu
set pumblend=30

" Statusline colors

augroup StatusColors
    autocmd!
    autocmd ColorScheme * call colors#UserColors()
augroup END

" Aize settings
let g:aize_italic = 1
let g:aize_italic_comments = 1
let g:aize_underline = 1

colorscheme aize

" Source config files
runtime! config/*.vim
" }}}

" Vim: set fdm=marker fmr={{{,}}} fdl=0 fdls=-1:
