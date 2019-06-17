" ~/.config/nvim/config/plugins.vim
" VIM-PLUG ( https://github.com/junegunn/vim-plug )

" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup InstallVimPlug
        autocmd!
        autocmd VimEnter * PlugInstall
    augroup END
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" PLUGINS LIST
" Make sure you use single quotes

" AUTOCOMPLETE
" Intellisense engine
Plug 'neoclide/coc.nvim', { 'do': './install.sh nightly' }
" Asynchronous linting/fixing for Vim and Language Server Protocol
Plug 'w0rp/ale'
" Defaults snippets for coc-snippets
Plug 'honza/vim-snippets'

" GIT
" Show a diff using Vim its sign column
Plug 'mhinz/vim-signify'
" A Git wrapper
Plug 'tpope/vim-fugitive'

" FILES MANAGER
" Fuzzy searching
Plug '~/.config/fzf'
Plug 'junegunn/fzf.vim'
" Filter and jump to quickfix list errors with fzf
Plug 'fszymanski/fzf-quickfix', {'on': '<Plug>(fzf-quickfix)'}
" Fast and featureful file manager powered by nnn
Plug 'mcchrish/nnn.vim', { 'on': ['Np', 'NnnPicker'] }
" View and search LSP symbols, tags
Plug 'liuchengxu/vista.vim', { 'on': ['Vista', 'Vista!', 'Vista!!'] }
" A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'

" UI
" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" Hyperfocus-writing in Vim
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }

" MISC
" Underlines the word under the cursor
Plug 'itchyny/vim-cursorword'
" Comment stuff out with `gcc`
Plug 'tpope/vim-commentary'
" A Vim alignment plugin
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
" Color hex codes and color names
Plug 'RRethy/vim-hexokinase', { 'on': 'HexokinaseToggle' }
" Delete buffers and close files in Vim without closing your windows
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }
" Auto close parentheses
Plug 'cohama/lexima.vim'
" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Enable repeating supported plugin maps with . 
Plug 'tpope/vim-repeat'

" LANGUAGES
" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'less', 'vue'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'wavded/vim-stylus', { 'for': 'styl' }

" JAVASCRIPT
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'flowtype/vim-flow', { 'for': 'javascript' }

" Latex
Plug 'lervag/vimtex', { 'for': 'tex' }

" MARKDOWN
" An asynchronous markdown preview plugin 
function! BuildComposer(info) abort
    if a:info.status != 'unchanged' || a:info.force
        !cargo build --release
    endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'for': 'markdown', 'do': function('BuildComposer') }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }

" RUST
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" SXHKDRC
Plug 'baskerville/vim-sxhkdrc', { 'for': 'sxhkdrc' }

" Always load the vim-devicons as the very last one
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
