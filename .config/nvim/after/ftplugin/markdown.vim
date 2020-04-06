setlocal textwidth=80
" set conceallevel=2
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

" Plugins ( https://github.com/plasticboy/vim-markdown )
" Disable folding
" let g:vim_markdown_folding_disabled = 1
setlocal foldmethod=syntax
let g:markdown_folding = 1
" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" Disable default key mappings
" let g:vim_markdown_no_default_key_mappings = 1
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" Do not automatically insert bulletpoints
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
" Change how to open new files
let g:vim_markdown_edit_url_in = 'tab'

" MARKDOWN COMPOSER ( https://github.com/euclio/vim-markdown-composer )
" If set to 0, the plugin will not attempt to open the user's browser, instead requiring them to open it manually
let g:markdown_composer_open_browser = 0
let g:markdown_composer_browser = 'firefox'
let g:markdown_composer_syntax_theme = 'atom-one-light'

nnoremap <silent> <Leader>p :ComposerOpen<CR>
nnoremap <silent> <Leader>pr :ComposerUpdate<CR>

