local util = require "util"
-- TODO Revrite some functions in lua


-- Change leader key to space
vim.g.mapleader = " "


-- Normal mode with "jk" or "kj"
util.bind_key("i", "jk", "<esc>")
util.bind_key("i", "kj", "<esc>")

-- Move updown by visual (wrapped) lines
util.bind_key("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true})
util.bind_key("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true})

-- Use <Tab> and <S-Tab> to navigate through popup menu
util.bind_key("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", {noremap = true, expr = true})
util.bind_key("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", {noremap = true, expr = true})

-- Easier start & end of the line
util.bind_key("n", "H", "^")
util.bind_key("n", "L", "$")

-- Editing
util.bind_key("n", "<Leader>w", ":w<CR>")
util.bind_key("n", "<Leader>z", ":q<CR>")
util.bind_key("n", "<Leader>x", ":xa<CR>")
util.bind_key("n", "<Leader>!", ":q!<CR>")
-- Easier for azerty
util.bind_key("n", ";", ".")
-- Apend ;/, at the end of the line
util.bind_key("n", "<Leader>;", ":normal A;<CR>")
util.bind_key("n", "<Leader>,", ":normal A,<CR>")
-- Don't lose selection when shifting sidewards
util.bind_key("x", "<", "<gv")
util.bind_key("x", ">", ">gv")
-- Yank the world under the cursor
util.bind_key("n", "yc", "vawy")
-- Makes s act like d, except it doesn’t save the cut text to a register
util.bind_key('n', 's', '"_d')

-- Windows
-- Move to the split in the direction shown, or create a new split
-- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
util.bind_key("n", "<C-Right>", ":call util#intelligentVerticalResize('right')<CR>")
util.bind_key("n", "<C-h>", ":call util#WinMove('h')<CR>")
util.bind_key("n", "<C-j>", ":call util#WinMove('j')<CR>")
util.bind_key("n", "<C-k>", ":call util#WinMove('k')<CR>")
util.bind_key("n", "<C-l>", ":call util#WinMove('l')<CR>")
-- Intelligent windows resizing using ctrl + arrow keys
util.bind_key("n", "<C-Left>", ":call util#intelligentVerticalResize('left')<CR>")
util.bind_key("n", "<C-Up>", ":resize -1<CR>")
util.bind_key("n", "<C-down>", ":resize +1<CR>")

-- Tabs
util.bind_key("n", "tl", ":tabnext<CR>")
util.bind_key("n", "th", ":tabprev<CR>")
util.bind_key("n", "tn", ":tabnew<CR>")
-- Fake zoom, open current file in a new tab
util.bind_key("n", "tz", ":tabnew %<CR>")

-- Buffers
util.bind_key("n", "+", ":bn<CR>")
util.bind_key("n", "_", ":bp<CR>")

-- Clear serach results
util.bind_key("n", "<esc>", ":noh<CR>")

-- Spell
util.bind_key("n", "<F9>", "<Esc>:silent setlocal spell! spelllang=en<CR>")
util.bind_key("n", "<F10>", "<Esc>:silent setlocal spell! spelllang=fr<CR>")

-- Quickly move current line
util.bind_key("n", "mm", ":<c-u>execute 'move -1-'. v:count1<CR>")
util.bind_key("n", "MM", ":<c-u>execute 'move +'. v:count1<CR>")

-- Get color group name of the syntax group where the cursor is
util.bind_key("n", "<F12>", ":call util#SyntaxGroup()<CR>")

-- Toggle between number and relative number
util.bind_key("n", "<Leader>à", ":call number#ToggleNumber()<CR>")

-- TODO Search helpers
--[[
  nnoremap \s :let @s="\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
  xnoremap \s "sy:%s/<C-r>s//<Left>
  ]]


-- PLUGINS --
-- Nnn
-- Start in the current file's directory
util.bind_key("n", "<F6>", ":NnnPicker '%:p:h'<CR>")

-- Goyo
util.bind_key("n", "<Leader>g", ":Goyo<CR>")

-- Vim-Bbye
util.bind_key("n", "<Leader>q", ":Bdelete<CR>")

-- Hexokinase
util.bind_key("n", "<Leader>h", ":HexokinaseToggle<CR>")

-- Easy Align
-- Start interactive EasyAlign in visual mode (e.g. vipga)
util.bind_key("x", "ga", "<Plug>(EasyAlign)", {silent = true})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
util.bind_key("n", "ga", "<Plug>(EasyAlign)", {silent = true})

-- Fzf
-- Search files recursively
util.bind_key("n", "<Leader>o", ":Files<CR>")
-- Search between open files
util.bind_key("n", "<Leader>b", ":Buffers<CR>")
-- Ripgrep
util.bind_key("n", "<Leader>r", ":RG<CR>")
-- Search lines
util.bind_key("n", "<Leader>l", ":Blines<CR>")
util.bind_key("n", "<Leader>L", ":Lines<CR>")
-- Search ctags
util.bind_key("n", "<Leader>t", ":Btags<CR>")
util.bind_key("n", "<Leader>T", ":Tags<CR>")

-- Vim spelling suggestions with fzf
-- ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
util.bind_key("n", "z=", ":call fuzzy#FzfSpell()<CR>")

-- Search current word under cursor
util.bind_key("n", "<Leader>k", ":Rg! <C-R><C-W><CR>")

-- Fzf quickfix
-- Quickfix list
util.bind_key("n", "<Leader>F", ":Quickfix<CR>")
-- Location list
util.bind_key("n", "<Leader>f", ":Quickfix!<CR>")
