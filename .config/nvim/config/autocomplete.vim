" ~/.config/neovim/config/autocomplete.vim
" COC ( https://github.com/neoclide/coc.nvim )

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Use <Tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> for navigate completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close preview window when completion is done
augroup ClosePreview
    autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Use K for show documentation in preview window
function! s:show_documentation() abort
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Open List
nnoremap <silent> <Leader>cl :<C-u>CocList<CR>
nnoremap <silent> <Leader>cy :<C-u>CocList yank<CR>
nnoremap <silent> <Leader>cw :<C-u>CocList words<CR>
nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
nnoremap <silent> <Leader>cq :<C-u>CocList quickfix<CR>
nnoremap <silent> <Leader>cm :<C-u>CocList mru<CR>
nnoremap <silent> <Leader>cs :<C-u>CocList symbols<CR>
nnoremap <silent> <Leader>cc :<C-u>CocList commands<CR>
nnoremap <silent> <Leader>cd :<C-u>CocList diagnostics<CR>
