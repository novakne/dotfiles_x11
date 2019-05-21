" Include - for completion
setlocal iskeyword+=-

" Use 2 space
setlocal softtabstop=2
setlocal shiftwidth=2

"ALE
let b:ale_linters = ['stylelint', 'prettier']
let b:ale_fixers = ['prettier']
