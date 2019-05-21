" ~/.config/nvim/config/linter.vim
" ALE ( https://github.com/w0rp/ale )

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" Always show sign column
let g:ale_sign_column_always = 1
" Disable line higlighting
let g:ale_set_highlights = 0
" Sign
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
" Echo format
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %severity%  %s'
let g:ale_loclist_msg_format = '[%linter%] %severity%  %s'
" Diagnostics window
let g:ale_list_window_size = 5

" Mappings
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
nmap <silent> <A-d> <Plug>(ale_detail)
