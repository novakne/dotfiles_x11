" ~/.config/nvim/init.vim

" Add fzf to runtime
set rtp+=~/.config/fzf

" Need to do this for lua plugins
packadd! nvim-colorizer.lua
packadd! completion-nvim
packadd! nvim-lsp

" Load config
lua require("init")
colorscheme aize-lua

