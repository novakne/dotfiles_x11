" Aize ~/.config/nvim/colors/aize.vim

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "aize-lua"
lua require 'colors.aize'
