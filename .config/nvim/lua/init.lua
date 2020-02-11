local command = vim.api.nvim_command

-- Global options
command [[set number]] -- Show line number
command [[set scrolloff=5]] -- Always 5 lines under cursor
command [[set noswapfile]] -- No swap
command [[set nobackup]] -- No backup
-- Enables to switch between unsaved buffers and keep undo history
command [[set hidden]]
-- Don't insert line breaks in the middle of a word
command [[set linebreak]]
command [[set textwidth=100]]
-- Use 4 spaces instead of tab
-- Copy indent from current line when starting a new line
command [[set autoindent]]
command [[set tabstop=8]]
command [[set softtabstop=4]]
command [[set shiftwidth=4]]
command [[set expandtab]]

command [[set splitbelow]] -- Puts new split windows to the bottom of the current
command [[set splitright]] -- Puts new vsplit windows to the right of the current
command [[set clipboard+=unnamedplus]] -- Use the clipboard for all operations
-- Make backspace work like most other programs
command [[set backspace=indent,eol,start]]
command [[set inccommand=nosplit]] -- Show preview of substitute command
command [[set mouse=a]] -- Enable mouse
command [[set shortmess+=c]] -- Don't give |ins-completion-menu| messages.
command [[set pyxversion=3]] -- Use python 3
command [[set selection=exclusive]] -- Dont select newline in visual mode ( v$ )
command [[set lazyredraw]] -- Do not redraw screen in the middle of a macro

-- COMPLETION ( :help 'complete' )
command [[set wildmenu]] -- Enhanced cmd line completion
command [[set wildchar=<TAB>]] -- Key for line completion
command [[set wildignorecase]] -- Ignore case when completing file and directory

-- SEARCH
command [[set hlsearch]] -- Highlight search results
command [[set incsearch]] -- Search whilst typing
command [[set ignorecase]] -- Case insensitive searching
command [[set smartcase]] -- Override ignorecase if upper case typed
command [[set more]] -- Stop in list

-- THEME
command [[set termguicolors]]
command [[set noshowcmd]]
command [[set noshowcmd]]
