" ~/.config/nvim/init.vim

lua require "config"
colorscheme aize-lua
runtime! config/*.vim

lua require "lsp_config"
set tabline=%!statusline#TabLine()
