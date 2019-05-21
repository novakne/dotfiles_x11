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
    let status .= "%{statusline#GitBranch()}"
    " Center
    let status .= "%="
    let status .= "%{statusline#NearestFunction()}"
    " Right
    let status .= "%="
    let status .= "%6*%{statusline#AleError()}%*"
    let status .= "%7*%{statusline#AleWarning()}%*"
    let status .= " %02p%% ◾ℂ%02c "
    let status .= ModeColor()
    let status .= "%{statusline#CocStatus()}%*"
    return status
endfunction

set statusline=%!Statusline()

" ___TABLINE___

function! MyTabLabel(n) abort
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
