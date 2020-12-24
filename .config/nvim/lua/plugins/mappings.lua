local util = require("util")

local mapping = {
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
  ["n<Leader>l"] = { ":BLines<CR>" },
  ["n<Leader>L"] = { ":Lines<CR>" },
  -- Search ctags
  ["n<Leader>t"] = { ":BTags<CR>" },
  ["n<Leader>T"] = { ":Tags<CR>" },

  -- Vim spelling suggestions with fzf
  -- ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
  -- ["n"] = "z=", ":call fuzzy#FzfSpell()<CR>")
  ["nz="] = { ":lua require'util'.fzf_spell()<CR>" },

  -- Search current word under cursor
  ["n<Leader>k"] = { ":Rg <C-R><C-W><CR>" },

  -- Goyo
  ["n<Leader>g"] = { ":Goyo<CR>" },

  -- Nnn
  -- Start in the current file's directory
  ["n<F6>"] = { ":NnnPicker %:p:h<CR>" },

    -- Nvim Colorizer
  ["n<Leader>h"] = { ":ColorizerToggle<CR>" },

  -- Vim-Bbye
  ["n<Leader>q"] = { ":Bdelete<CR>" },

	-- Vim-Sneak
  ["nf"] = { "<Plug>Sneak_s", { silent = true } },
  ["nF"] = { "<Plug>Sneak_S", { silent = true } },

}

util.bind_key(mapping)
