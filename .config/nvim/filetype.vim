" ~/.config/nvim/filetype.vim

augroup FiletypeDetect
    autocmd!
    autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown 
    autocmd BufRead,BufNewFile *.rs set filetype=rust
    autocmd BufRead,BufNewFile *.rasi set filetype=css
    autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
    autocmd BufRead,BufNewFile *.conf set filetype=cfg
augroup end
