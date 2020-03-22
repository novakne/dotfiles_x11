function! statusline#InactiveLine()
    return luaeval("require'statusline'.inactiveLine()")
endfunction

function! statusline#ActiveLine()
    return luaeval("require'statusline'.activeLine()")
endfunction

function! statusline#TabLine()
    return luaeval("require'statusline'.tabline()")
endfunction
