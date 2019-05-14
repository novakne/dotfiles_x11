" ~/.config/nvim/autoload/colors.vim

" Statusline colors
function! g:colors#UserColors() abort
    highlight User1 guifg=#29223a  guibg=#fc65b0
    highlight User2 guifg=#29223a  guibg=#e8ec77
    highlight User3 guifg=#29223a  guibg=#2dcbb0
    highlight User4 guifg=#29223a  guibg=#a89bee
    highlight User5 guifg=#29223a  guibg=#57bbf4

    highlight User6 guifg=#fc65b0  guibg=#3e3350
    highlight User7 guifg=#e8ec77  guibg=#3e3350
    highlight User8 guifg=#57bbf4  guibg=#3e3350
endfunction

" Get color group name of the syntax group where the cursor is
function! g:colors#SyntaxGroup() abort
    let l:s = synID(line('.'), col('.'), 1) 
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

