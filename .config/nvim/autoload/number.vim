" ~/.config/nvim/autoload/number.vim

" Toggle between number and relative number
function! g:number#ToggleNumber() abort
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

