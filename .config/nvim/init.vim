" ~/.config/nvim/init.vim

call plug#begin(stdpath('data') . '/plug')

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'steelsojka/completion-buffers'


" Files
Plug '~/.config/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'fszymanski/fzf-quickfix', { 'on': 'Quickfix' }
Plug 'mcchrish/nnn.vim', { 'on': ['Np', 'NnnPicker'] }
Plug 'ludovicchabant/vim-gutentags'

" UI
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }

" Misc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
Plug 'itchyny/vim-cursorword'
Plug 'mhinz/vim-signify'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'justinmk/vim-sneak', { 'on': ['<Plug>Sneak_s', '<Plug>Sneak_S']  }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure', 'fennel'] }
Plug 'voldikss/vim-floaterm'

" Lang
let g:polyglot_disabled = ['latex']
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Load config
lua require("init")
colorscheme aize-black-lua
