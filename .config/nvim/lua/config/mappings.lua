local util = require("util")

-- TODO Revrite some functions in lua

local mapping = {
  -- Normal mode with "jk" or "kj"
  ["ijk"] = { "<esc>" },
  ["ikj"] = { "<esc>" },

  -- Move updown by visual (wrapped) lines
  ["nj"] = { "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true } },
  ["nk"] = { "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true } },

  -- Use <Tab> and <S-Tab> to navigate through popup menu
  ["i<Tab>"] = { "pumvisible() ? '<C-n>' : '<Tab>'", { noremap = true, expr = true } },
  ["i<S-Tab>"] = { "pumvisible() ? '<C-p>' : '<S-Tab>'", { noremap = true, expr = true } },

  -- Easier start & end of the line
  ["nH"] = { "^" },
  ["nL"] = { "$" },

  -- Editing
  ["n<Leader>w"] = { ":w<CR>" },
  ["n<Leader>z"] = { ":q<CR>" },
  ["n<Leader>x"] = { ":xa<CR>" },
  ["n<Leader>!"] = { ":q!<CR>" },
  -- Easier for azerty
  -- ["n;"] = { "." },
  -- Apend ;/, at the end of the line
  ["n<Leader>;"] = { ":normal A;<CR>" },
  ["n<Leader>,"] = { ":normal A,<CR>" },
  -- Don't lose selection when shifting sidewards
  ["x<"] = { "<gv" },
  ["x>"] = { ">gv" },
  -- Yank the world under the cursor
  ["nyc"] = { "vawy" },
  -- Makes s act like d, except it doesn’t save the cut text to a register
  ["ns"] = { '"_d' },

  -- Windows
  -- Move to the split in the direction shown, or create a new split
  -- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
  ["n<C-h>"] = { ":lua require'util'.win_move('h')<CR>" },
  ["n<C-j>"] = { ":lua require'util'.win_move('j')<CR>" },
  ["n<C-k>"] = { ":lua require'util'.win_move('k')<CR>" },
  ["n<C-l>"] = { ":lua require'util'.win_move('l')<CR>" },

  -- Intelligent windows resizing using ctrl + arrow keys
  ["n<C-Right>"] = { ":lua require'util'.vertical_resize('right')<CR>" },
  ["n<C-Left>"] = { ":lua require'util'.vertical_resize('left')<CR>" },
  ["n<C-Up>"] = { ":resize -1<CR>" },
  ["n<C-Down>"] = { ":resize +1<CR>" },

  -- Tabs
  ["ntl"] = { ":tabnext<CR>" },
  ["nth"] = { ":tabprev<CR>" },
  ["ntn"] = { ":tabnew<CR>" },
  -- Fake zoom, open current file in a new tab
  ["ntz"] = { ":tabnew %<CR>" },

  -- Buffers
  ["n+"] = { ":bn<CR>" },
  ["n_"] = { ":bp<CR>" },

  -- Clear serach results
  ["n<esc>"] = { ":noh<CR>" },

  -- Spell
  ["n<F9>"] = { ":setlocal spell! spelllang=en<CR>" },
  ["n<F10>"] = { ":setlocal spell! spelllang=fr<CR>" },

  -- Quickly move current line
  ["nmm"] = { ":<c-u>execute 'move -1-'. v:count1<CR>" },
  ["nMM"] = { ":<c-u>execute 'move +'. v:count1<CR>" },

  -- Get color group name of the syntax group where the cursor is
  ["n<F12>"] = { ":lua require'util'.syntax_group()<CR>" },

  -- Toggle between number and relative number
  ["n<Leader>à"] = { ":lua require'util'.toggle_number()<CR>" },

  -- Toggle terminal
  ["n<Leader>s"] = { ":lua require'plugins.toggle_term'.toggle()<CR>" },
  ["t<Leader>s"] = { "<C-\\><C-n>:lua require'plugins.toggle_term'.toggle()<CR>" },

  -- TODO Search helpers
  --[[
  nnoremap \s :let @s="\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
  xnoremap \s "sy:%s/<C-r>s//<Left>
-- ]]

  -- Copy, move or delete the first occurence of the search
  -- e.g. /word$t
  ["c$t"] = { "<CR>:t''<CR>" },
  ["c$T"] = { "<CR>:T''<CR>" },
  ["c$m"] = { "<CR>:m''<CR>" },
  ["c$M"] = { "<CR>:M''<CR>" },
  ["c$d"] = { "<CR>:d<CR>``" },


  -- PLUGINS --
  -- Nnn
  -- Start in the current file's directory
  ["n<F6>"] = { ":NnnPicker '%:p:h'<CR>" },

  -- Nvim Colorizer
  ["n<Leader>h"] = { ":ColorizerToggle<CR>" },

  -- Goyo
  ["n<Leader>g"] = { ":Goyo<CR>" },

  -- Vim-Bbye
  ["n<Leader>q"] = { ":Bdelete<CR>" },

  -- Easy Align
  -- Start interactive EasyAlign in visual mode (e.g. vipga)
  ["xga"] = { "<Plug>(EasyAlign)", { silent = true } },
  -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
  ["nga"] = { "<Plug>(EasyAlign)", { silent = true } },

  -- Fzf
  -- Search files recursively
  ["n<Leader>o"] = { ":Files<CR>" },
  -- Search between open files
  ["n<Leader>b"] = { ":Buffers<CR>" },
  -- Ripgrep
  ["n<Leader>r"] = { ":RG<CR>" },
  -- Search lines
  ["n<Leader>l"] = { ":Blines<CR>" },
  ["n<Leader>L"] = { ":Lines<CR>" },
  -- Search ctags
  ["n<Leader>t"] = { ":Btags<CR>" },
  ["n<Leader>T"] = { ":Tags<CR>" },

  -- Vim spelling suggestions with fzf
  -- ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
  -- ["n"] = "z=", ":call fuzzy#FzfSpell()<CR>")
  ["nz="] = { ":lua require'util'.fzf_spell()<CR>" },

  -- Search current word under cursor
  ["n<Leader>k"] = { ":Rg! <C-R><C-W><CR>" },

  -- Fzf quickfix
  -- Quickfix list
  ["n<Leader>F"] = { ":Quickfix<CR>" },
  -- Location list
  ["n<Leader>f"] = { ":Quickfix!<CR>" },

  -- Vim-Sneak
  ["nf"] = { "<Plug>Sneak_s", { silent = true } },
  ["nF"] = { "<Plug>Sneak_S", { silent = true } }
}

util.bind_key(mapping)
