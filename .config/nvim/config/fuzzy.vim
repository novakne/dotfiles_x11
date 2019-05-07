" ~/.config/nvim/config/fuzzy.vim

" FZF ( https://github.com/junegunn/fzf.vim )
" Layout
let g:fzf_layout = { 'window': '10new' } 
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

" Vim spelling suggestions with fzf
" ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
function! FzfSpellSink(word) abort
    exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell() abort
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

nnoremap z= :call FzfSpell()<CR>

" Hide statusbar
augroup HideStatus
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2
augroup END

" Key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }

" Search files recursively
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :FilesP<CR>
" Search between open files
nnoremap <silent> <leader>b :Buffers<CR>
" Ripgrep
nnoremap <silent> <leader>r :Rg!<CR>
nnoremap <silent> <leader>R :Rg<CR>
" Search lines
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>L :Lines<CR>
" Serach ctags
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>

" FZF QUICKFIX ( https://github.com/fszymanski/fzf-quickfix )
" Enable location list to use with Ale
let g:fzf_quickfix_use_loclist = 1
nmap <silent> <Leader>f <Plug>(fzf-quickfix)
