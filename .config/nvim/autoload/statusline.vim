function! statusline#InactiveLine()
    return luaeval("require'statusline'.inactive_line()")
endfunction

function! statusline#ActiveLine()
    return luaeval("require'statusline'.active_line()")
endfunction

function! statusline#TabLine()
    return luaeval("require'statusline'.tabline()")
endfunction
