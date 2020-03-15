" ~/.config/nvim/config/statusline

" ___STATUSLINE___

" FUNCTIONS
" Mode list
let s:modes ={
    \ 'n'  : ['%3*', 'NORMAL'],
    \ 'i'  : ['%2*', 'INSERT'],
    \ 'v'  : ['%1*', 'VISUAL'],
    \ 'r'  : ['%4*', 'REPLACE'],
    \ 'c'  : ['%5*', 'COMMAND'],
    \ 't'  : ['%5*', 'TERMINAL'],
    \ '!'  : ['%5*', 'SHELL']
    \ }

" Get current mode
function! CurrentMode() abort
    return '   ' . get(s:modes, tolower(mode()), '-')[1] . '    '
endfunction

" Change colors depending on mode
function! ModeColor() abort
    return get(s:modes, tolower(mode()), '%*')[0]
endfunction

" Nvim LSP Errors / Warnings
" function! LspStatus() abort
"     let sl = ''
"     if luaeval('vim.lsp.buf.server_ready()')
"         if luaeval('vim.lsp.util.buf_diagnostics_count("Error")') ==? 'null'
"             let sl.='%#MyStatusLineLSPErrors#'
"         else
"             let sl.='%#MyStatuslineLSP# : '
"             let sl.='%#MyStatuslineLSPErrors#%{luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")}'
"         endif
"         if luaeval('vim.lsp.util.buf_diagnostics_count("Warning")') ==? 'null'
"             let sl.='%#MyStatusLineLSPErrors#'
"         else
"             let sl.='%#MyStatuslineLSP#   : '
"             let sl.='%#MyStatuslineLSPWarnings#%{luaeval("vim.lsp.util.buf_diagnostics_count(\"Warning\")")}'
"         endif
"     else
"         let sl.='%#MyStatuslineLSPErrors#'
"     endif
"     return sl
" endfunction

" COMPONENTS
function! Statusline() abort
    let status = ""
    " Truncate here
    let status .= "%<"
    " Left
    let status .= ModeColor()
    let status .= CurrentMode()
    let status .= "%*\ "
    let status .= "%{mpi#get(expand('%:t'))}\ "
    let status .= "%f%{&modified?'':''}\ "
    let status .= "%{&readonly?'':''}"
    let status .= "\ "
    let status .= "%{statusline#GitBranch()}"
    " Center
    let status .= "%="
    let status .= "%{statusline#NearestFunction()}"
    " Right
    let status .= "%="
    let status .= " %02p%% ◾ℂ%02c "
    " let status .= LspStatus()
    return status
endfunction

set statusline=%!Statusline()
set tabline=%!tabline#Tabline()
