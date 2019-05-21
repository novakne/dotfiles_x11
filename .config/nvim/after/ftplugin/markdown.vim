setlocal textwidth=80
setlocal spell spelllang=fr
set conceallevel=2
let g:markdown_fenced_languages=[
            \ 'c',
            \ 'cpp',
            \ 'css',
            \ 'html',
            \ 'javascript',
            \ 'python',
            \ 'sh',
            \ 'vim'
            \]

" ALE
let b:ale_linters = ['prettier']
let b:ale_fixers = ['prettier']
