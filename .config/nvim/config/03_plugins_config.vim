" ~/.config/neovim/config/plugins_config.vim

" VISTA ( https://github.com/liuchengxu/vista.vim )
" How each level is indented and what to prepend.
let g:vista_icon_indent = ["▸ ", ""]
" To enable fzf's preview window
let g:vista_fzf_preview = ['right:50%']
" disable echoing when the cursor moves
let g:vista_blink = [1, 100]
" Executive used when opening vista sidebar without specifying it.
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 1
let g:vista_echo_cursor_strategy = "both"

nnoremap <silent> <F8> :Vista!!<CR>
nnoremap <silent> <F7> :Vista ctags<CR>
nnoremap <silent> <Leader>c :Vista finder coc<CR>


" GUTENTAGS ( https://github.com/ludovicchabant/vim-gutentags )
" Group all tags files in a folder
let g:gutentags_cache_dir='~/.cache/tags'


" NNN ( https://github.com/mcchrish/nnn.vim )
" let g:nnn#layout = { 'left': '~25%' }
let g:nnn#layout = '10new'
let g:nnn#command = 'nnn'
let g:nnn#set_default_mappings = 0
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-h>': 'split',
      \ '<c-v>': 'vsplit' }

nnoremap <silent> <F6> :NnnPicker<CR>


" GOYO ( https://github.com/junegunn/goyo.vim )
" Launch Limelight with Goyo
augroup GoyoMode
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

nnoremap <silent> <Leader>g :Goyo<CR>


" SIGNIFY ( https://github.com/mhinz/vim-signify )
let g:signify_vcs_list = [ 'git', 'yadm' ]
let g:signify_sign_add ='✓'
let g:signify_sign_delete ='✗'
let g:signify_sign_delete_first_line ='-'
let g:signify_sign_change ='✶'
let g:signify_sign_changedelete ='~'
let g:signify_sign_show_count = 1


" MARKDOWN COMPOSER ( https://github.com/euclio/vim-markdown-composer )
" If set to 0, the plugin will not attempt to open the user's browser, instead requiring them to open it manually
let g:markdown_composer_open_browser = 0
let g:markdown_composer_browser = 'firefox'
let g:markdown_composer_syntax_theme = 'dracula'

nnoremap <silent> <Leader>p :ComposerOpen<CR>
nnoremap <silent> <Leader>pr :ComposerUpdate<CR>


" VIM-BBYE ( https://github.com/moll/vim-bbye )
nnoremap <silent> <Leader>q :Bdelete<CR>


" HEXOKINASE ( https://github.com/RRethy/vim-hexokinase )
nnoremap <silent> <Leader>h :HexokinaseToggle<CR>


" EASY ALIGN ( https://github.com/junegunn/vim-easy-align )
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <silent> ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <silent> ga <Plug>(EasyAlign)
