" Plugin ( https://github.com/rust-lang/rust.vim )
let g:rust_conceal = 1
let g:rust_conceal_pub = 1
let g:rustfmt_autosave = 1

nnoremap <buffer> <LocalLeader>rr :RustRun<CR>
nnoremap <buffer> <LocalLeader>rf :RustFmt<CR>
