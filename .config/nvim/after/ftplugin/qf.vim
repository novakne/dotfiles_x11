" Hide statusbar
setlocal laststatus=0 noshowmode noruler
augroup QfStatus
    autocmd!
    autocmd BufLeave <buffer> set laststatus=2
augroup END

