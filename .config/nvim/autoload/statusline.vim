function! statusline#InactiveLine()
    return luaeval("require'statusline'.inactive()")
endfunction

function! statusline#ActiveLine()
    return luaeval("require'statusline'.active()")
endfunction

function! statusline#TabLine()
    return luaeval("require'statusline'.tabline()")
endfunction
