" ~/.config/nvim/config/commands.vim

command! PackInstall call pack#PackagerInit() | call packager#install()
command! -bang PackUpdate call pack#PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean call pack#PackagerInit() | call packager#clean()
command! PackStatus call pack#PackagerInit() | call packager#status()

command! -nargs=* VTerm vsplit | terminal <args>
command! -nargs=* STerm split | terminal <args>
command! -nargs=* TTerm tabnew | terminal <args>

" Make current buffer executable
command! Chmodx :!chmod a+x %

" Change to directory of current file
command! Cd :cd %:p:h
command! Cdw :lcd %:p:h
command! Cdt :tcd %:p:h

" Fzf
command! -nargs=* -bang RG lua require'util'.ripgrep_fzf(<q-args>, <bang>0)

