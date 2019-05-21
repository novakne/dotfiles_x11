" ~/.config/nvim/config/languages.vim

" JAVASCRIPT ( https://github.com/pangloss/vim-javascript )
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1
" Enables syntax highlighting for Flow
let g:javascript_plugin_flow = 1

" FLOW ( https://github.com/flowtype/vim-flow )
" If this is set to 1, the quickfix window will not be opened when there are no errors
" and will be automatically closed when previous errors are cleared
let g:flow#autoclose = 1
" Typechecking is done automatically on :w if set to 1
let g:flow#enable = 0
" By default, results are shown in a quickfix window. Setting this to 0 will stop the window from being shown. 
" This is useful if you want to use vim-flow for the omnicomplete functionality, but are already using something like ale.
let g:flow#showquickfix = 0

" JSX ( https://github.com/amadeus/vim-jsx )
" Enable only for .jsx
let g:jsx_ext_required = 1

" LATEX ( https://github.com/lervag/vimtex )
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:method_view_method = 'zathura'
let g_vimtex_latexmk_continuous = 1
let g:vimtex_compiler_latexmk_engines = 5
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : 'tmp',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-verbose',
            \   '-pdflatex="xelatex --shell-escape %O %S"',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

nnoremap <Leader>lt :call vimtex#fzf#run()<CR>

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
