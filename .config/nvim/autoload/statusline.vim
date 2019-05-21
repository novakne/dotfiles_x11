" Coc server infos
function! statusline#CocStatus() abort
    let coc = coc#status()
    if coc != ''
        return '  '.coc#status().'  '
    else
        return ''
endfunction

" Linter info with ALE
" Error
function! statusline#AleError() abort
    let ale = ale#statusline#Count(bufnr('%'))
    if ale['error'] > 0
        return "  \uf12a " . ale['error'] . " "
    else
        return ''
endfunction

" Warning
function! statusline#AleWarning() abort
    let ale = ale#statusline#Count(bufnr('%'))
    if ale['warning'] > 0
        return "  \uf128 " . ale['warning'] . " "
    else
        return ''
endfunction

" Git branch with fugitive
function! statusline#GitBranch() abort
    let git = fugitive#head()
    if git != ''
	return "\ue0a0".fugitive#head()
    else
	return ''
endfunction

" Show the nearest method/function with vista
function! statusline#NearestFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

