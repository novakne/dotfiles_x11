" Hide statusbar
setlocal laststatus=0 noshowmode noruler
augroup FzfStatus
    autocmd!
    autocmd BufLeave <buffer> set laststatus=2
augroup END
