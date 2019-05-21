" ~/.config/nvim/autoload/util.vim

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! g:util#intelligentVerticalResize(direction) abort
    let l:window_resize_count = 5
    let l:current_window_is_last_window = (winnr() == winnr('$'))

    if (a:direction ==# 'left')
        let [l:modifier_1, l:modifier_2] = ['+', '-']
    else
        let [l:modifier_1, l:modifier_2] = ['-', '+']
    endif

    let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
    let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
    execute l:command
endfunction

" Get color group name of the syntax group where the cursor is
function! g:util#SyntaxGroup() abort
    let l:s = synID(line('.'), col('.'), 1) 
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
