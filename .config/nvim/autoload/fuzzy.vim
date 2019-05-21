" ~/.config/nvim/autoload/fuzzy.vim

" Vim spelling suggestions with fzf
" ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
function! g:fuzzy#FzfSpellSink(word) abort
    exe 'normal! "_ciw'.a:word
endfunction

function! g:fuzzy#FzfSpell() abort
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("fuzzy#FzfSpellSink"), 'down': 10 })
endfunction
