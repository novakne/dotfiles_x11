" ~/.config/nvim/init.vim

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

lua << EOF
 require('init')
EOF

