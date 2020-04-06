" ~/.config/neovim/config/plugins_config.vim

" NNN ( https://github.com/mcchrish/nnn.vim )
" Floating window
let g:nnn#layout = { 'window': { 'width': 0.5, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -e'
let g:nnn#set_default_mappings = 0
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-h>': 'split',
      \ '<c-v>': 'vsplit' }


" Completion-nvim ( https://github.com/haorenW1025/completion-nvim )
" make sure to specify none-ins_complete sources with 'ins_complete': v:false
let g:completion_chain_complete_list = [
    \{'ins_complete': v:false, 'complete_items': ['lsp']},
    \{'ins_complete': v:false, 'complete_items': ['snippet']},
    \{'ins_complete': v:true,  'mode': '<c-p>'},
    \{'ins_complete': v:true,  'mode': '<c-n>'},
    \{'ins_complete': v:true,  'mode': '<c-x><c-f>'},
    \{'ins_complete': v:true,  'mode': '<c-x><c-l>'},
    \{'ins_complete': v:true,  'mode': '<c-x><x-]>'},
    \{'ins_complete': v:true,  'mode': '<c-x>s'}
\]
" imap <c-j> <cmd>lua require'source'.prevCompletion()<CR>
" imap <c-k> <cmd>lua require'source'.nextCompletion()<CR>
let g:completion_auto_change_source = 1


" FZF ( https://github.com/junegunn/fzf.vim )
" Layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Mappings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }

