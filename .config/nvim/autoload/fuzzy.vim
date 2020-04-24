" ~/.config/nvim/autoload/fuzzy.vim

" Vim spelling suggestions with fzf
" ( https://coreyja.com/vim-spelling-suggestions-fzf/ )
function! g:fuzzy#FzfSpellSink(word) abort
    exe 'normal! "_ciw'.a:word
endfunction

function! g:fuzzy#FzfSpell() abort
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("fuzzy#FzfSpellSink"), 'window': { 'width': 0.4, 'height': 0.6 } })
endfunction

