" Plugin ( https://github.com/rust-lang/rust.vim )

let g:rust_conceal = 1
let g:rust_conceal_pub = 1
let g:rustfmt_autosave = 1

nnoremap <buffer> <Leader>rr :RustRun<CR>
nnoremap <buffer> <Leader>rf :RustFmt<CR>
