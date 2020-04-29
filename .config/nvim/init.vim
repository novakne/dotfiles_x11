" ~/.config/nvim/init.vim

call plug#begin(stdpath('data') . '/plug')

" Lsp
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'

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

" Lang
let g:polyglot_disabled = ['clojure', 'latex']
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }
Plug 'Olical/conjure', { 'branch': 'develop', 'for': ['clojure', 'fennel'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()

" Load config
lua require("init")
colorscheme aize-black-lua

