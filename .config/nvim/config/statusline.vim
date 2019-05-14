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
    return '  ' . get(s:modes, tolower(mode()), '-')[1] . '  '
endfunction

" Change colors depending on mode
function! ModeColor() abort
    return get(s:modes, tolower(mode()), '%*')[0]
endfunction

" Git branch with fugitive
function! GitBranch() abort
    let git = fugitive#head()
    if git != ''
	return "\ue0a0".fugitive#head()
    else
	return ''
endfunction

" Coc server infos
function! CocStatus() abort
    let coc = coc#status()
    if coc != ''
        return '  '.coc#status().'  '
    else
        return ''
endfunction

" Linter info with ale
" Error
function! AleError() abort
    let ale = ale#statusline#Count(bufnr('%'))
    if ale['error'] > 0
        return "  \uf12a " . ale['error'] . " "
    else
        return ''
endfunction

" Warning
function! AleWarning() abort
    let ale = ale#statusline#Count(bufnr('%'))
    if ale['warning'] > 0
        return "  \uf128 " . ale['warning'] . " "
    else
        return ''
endfunction

" Show the nearest method/function with vista
function! NearestFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" COMPONENTS
function! Statusline() abort
    let status = ""
    " Truncate here
    let status .= "%<"
    " Left
    let status .= ModeColor()
    let status .= CurrentMode()
    let status .= "%*\ "
    let status .= "%{WebDevIconsGetFileTypeSymbol()}\ "
    let status .= "%f%{&modified?'':''}\ "
    let status .= "%{&readonly?'':''}"
    let status .= "\ "
    let status .= "%{GitBranch()}"
    " Center
    let status .= "%="
    let status .= "%{NearestFunction()}"
    " Right
    let status .= "%="
    let status .= "%6*%{AleError()}%*"
    let status .= "%7*%{AleWarning()}%*"
    let status .= " %p%% ◾ℂ%c "
    let status .= ModeColor()
    let status .= "%{CocStatus()}%*"
    return status
endfunction

set statusline=%!Statusline()

" ___TABLINE___

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])
endfunction

function! Tabline() abort
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#' . " %{&modified?'+':''}"
        else
            let s .= '%#TabLine#'
        endif

	    " set the tab page number (for mouse clicks)
	    let s .= '%' . (i + 1) . 'T'

	    " the label is made by MyTabLabel()
	    let s .= ' %{WebDevIconsGetFileTypeSymbol()} %{MyTabLabel(' . (i + 1) . ')} '
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s .= '%#TabLineFill#%T'

	  " right-align the label to close the current tab page
	  if tabpagenr('$') > 1
	    let s .= '%=%#TabLine#%999X  '
	  endif

	  return s
endfunction

set tabline=%!Tabline()
