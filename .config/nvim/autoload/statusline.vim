" Git branch with fugitive
function! statusline#GitBranch() abort
    let git = fugitive#head()
    if git != ''
	return "\ue0a0".fugitive#head()
    else
	return ''
    endif
endfunction

" Show the nearest method/function with vista
function! statusline#NearestFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

