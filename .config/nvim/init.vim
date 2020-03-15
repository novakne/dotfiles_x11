" ~/.config/nvim/init.vim

" GENERAL ( :help nvim-defaults )
" Show line number
set number
" Always 5 lines at the bottom
set scrolloff=5
" No swap / backup file
set noswapfile
set nobackup
" Enables to switch between unsaved buffers and keep undo history
set hidden
" Don't insert line breaks in the middle of a word
set linebreak
set textwidth=100
" Use 4 spaces instead of tab
" Copy indent from current line when starting a new line
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
" Do not redraw screen in the middle of a macro
set lazyredraw

" COMPLETION ( :help 'complete' )
" Key for line completion
set wildchar=<TAB>
" Ignore case when completing file and directory
set wildignorecase
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" SEARCH
" Case insensitive searching
set ignorecase
" Override ignorecase if upper case typed
set smartcase
" Stop in list
set more

" THEME
set termguicolors
set noshowmode
set noshowcmd
" Always show signcolumns
set signcolumn=yes
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300


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
" Change leader key
let mapleader="\<SPACE>"
lua require "config.mappings".set_keys()
runtime! config/*.vim
