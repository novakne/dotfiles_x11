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

" LSP
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lsp'
" A async completion framework aims to provide completion to neovim's built in LSP
Plug 'haorenW1025/completion-nvim'

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
Plug 'fszymanski/fzf-quickfix', { 'on': 'Quickfix' }
" Fast and featureful file manager powered by nnn
Plug 'mcchrish/nnn.vim', { 'on': ['Np', 'NnnPicker'] }
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
Plug 'RRethy/vim-hexokinase', { 'on': 'HexokinaseToggle', 'do': 'make hexokinase' }
" Delete buffers and close files in Vim without closing your windows
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }
" Auto close parentheses
Plug 'cohama/lexima.vim'
" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Enable repeating supported plugin maps with . 
Plug 'tpope/vim-repeat'

" LANGUAGES
" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'
" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Markdown
" An asynchronous markdown preview plugin 
function! BuildComposer(info) abort
    if a:info.status != 'unchanged' || a:info.force
        !cargo build --release --locked
    endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Initialize plugin system
call plug#end()
