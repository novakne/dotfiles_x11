
" Use LSP omni-completion
set omnifunc=v:lua.vim.lsp.omnifunc

lua require "lsp_config"

let g:LspDiagnosticsErrorSign = ''
let g:LspDiagnosticsWarningSign = ''
let g:LspDiagnosticsInformationSign = ''
let g:LspDiagnosticsHintSign = ''

" Keys
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
