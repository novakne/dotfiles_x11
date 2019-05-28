" ~/.config/nvim/config/commands.vim

command! -nargs=* VTerm vsplit | terminal <args>
command! -nargs=* STerm split | terminal <args>
command! -nargs=* TTerm tabnew | terminal <args>

" Make current buffer executable
command! Chmodx :!chmod a+x %

" Change to directory of current file
command! Cd :cd %:p:h
command! Cdw :lcd %:p:h
command! Cdt :tcd %:p:h
