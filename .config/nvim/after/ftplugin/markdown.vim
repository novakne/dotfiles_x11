augroup VimMarkdowSyntax
    autocmd!
    autocmd FileType markdown setlocal textwidth=80
    autocmd FileType markdown let g:markdown_fenced_languages=[
            \ 'c',
            \ 'cpp',
            \ 'css',
            \ 'html',
            \ 'javascript',
            \ 'python',
            \ 'sh',
            \ 'vim'
            \]
augroup END
