function! statusline#InactiveLine()
    return luaeval("require'my.statusline'.inactive()")
endfunction

function! statusline#ActiveLine()
    return luaeval("require'my.statusline'.active()")
endfunction

function! statusline#TabLine()
    return luaeval("require'my.statusline'.tabline()")
endfunction
