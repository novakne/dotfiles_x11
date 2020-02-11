" ~/.config/nvim/config/languages.vim

" JAVASCRIPT ( https://github.com/pangloss/vim-javascript )
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1
" Enables syntax highlighting for Flow
let g:javascript_plugin_flow = 1

" MARKDOWN ( https://github.com/plasticboy/vim-markdown )
" Disable folding
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
" Disable default key mappings
" let g:vim_markdown_no_default_key_mappings = 1
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" Do not automatically insert bulletpoints
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
" Change how to open new files
let g:vim_markdown_edit_url_in = 'tab'

" Editor Config
" To ensure that this plugin works well with Tim Pope's fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" RUST
nnoremap <Leader>rr :RustRun<CR>
nnoremap <Leader>rf :RustFmt<CR>
let g:rust_conceal = 1
let g:rust_conceal_pub = 1
let g:rustfmt_autosave = 1
