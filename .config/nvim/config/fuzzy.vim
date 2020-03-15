" ~/.config/nvim/config/fuzzy.vim

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

" Search files recursively
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>O :FilesP<CR>
" Search between open files
nnoremap <silent> <Leader>b :Buffers<CR>
" Ripgrep
nnoremap <silent> <Leader>r :Rg!<CR>
nnoremap <silent> <Leader>R :Rg<CR>
" Search lines
nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>L :Lines<CR>
" Serach ctags
nnoremap <silent> <Leader>t :BTags<CR>
nnoremap <silent> <Leader>T :Tags<CR>

" Vim spelling suggestions with fzf
" ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
nnoremap z= :call fuzzy#FzfSpell()<CR>

" Search current word under cursor
nnoremap <silent> <Leader>k :Rg! <C-R><C-W><CR>

" FZF QUICKFIX ( https://github.com/fszymanski/fzf-quickfix )
" Quickfix list
nnoremap <silent> <Leader>F :Quickfix<CR>
" Location list
nnoremap <silent> <Leader>f :Quickfix!<CR>
