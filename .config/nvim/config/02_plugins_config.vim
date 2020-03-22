" ~/.config/neovim/config/plugins_config.vim

" NNN ( https://github.com/mcchrish/nnn.vim )
" Floating window
let g:nnn#layout = { 'window': { 'width': 0.5, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -e'
let g:nnn#set_default_mappings = 0
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-h>': 'split',
      \ '<c-v>': 'vsplit' }


" FZF ( https://github.com/junegunn/fzf.vim )
" Layout
let g:fzf_layout = { 'window': '10new' } 
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:true } }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" :Rg - Start fzf with hidden preview window that can be enabled with ? key
" :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir FilesP
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Mappings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }


