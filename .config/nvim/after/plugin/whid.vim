if exists('g:loaded_whid') | finish | endif " prevent loading files twice

let s:save_cpo = &cpo " save user captions
set cpo&vim " reset them to defaults

" command to run our plugin
command! Whid lua require'whid'.whid()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_whid = 1
