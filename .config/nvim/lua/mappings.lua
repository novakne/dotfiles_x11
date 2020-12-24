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
  ["i<Tab>"]   = { "pumvisible() ? '<C-n>' : '<Tab>'", { noremap = true, expr = true } },
  ["i<S-Tab>"] = { "pumvisible() ? '<C-p>' : '<S-Tab>'", { noremap = true, expr = true } },

  -- Easier start & end of the line
  ["nH"] = { "^" },
  ["nL"] = { "$" },

  -- Editing
  ["n<Leader>w"] = { ":w<CR>" },
  ["n<Leader>z"] = { ":q<CR>" },
  ["n<Leader>x"] = { ":xa<CR>" },
  ["n<Leader>!"] = { ":q!<CR>" },
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
  -- Make Y act like D and C
  ["nY"] = { "y$" },

  -- Windows
  -- Move to the split in the direction shown, or create a new split
  -- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
  ["n<C-h>"] = { ":lua require'util'.win_move('h')<CR>" },
  ["n<C-j>"] = { ":lua require'util'.win_move('j')<CR>" },
  ["n<C-k>"] = { ":lua require'util'.win_move('k')<CR>" },
  ["n<C-l>"] = { ":lua require'util'.win_move('l')<CR>" },

  -- Intelligent windows resizing using ctrl + arrow keys
  ["n<C-Right>"] = { ":lua require'util'.vertical_resize('right')<CR>" },
  ["n<C-Left>"]  = { ":lua require'util'.vertical_resize('left')<CR>" },
  ["n<C-Up>"]    = { ":resize -1<CR>" },
  ["n<C-Down>"]  = { ":resize +1<CR>" },

  -- Tabs
  ["ntl"] = { ":tabnext<CR>" },
  ["nth"] = { ":tabprev<CR>" },
  ["ntn"] = { ":tabnew<CR>" },
  -- Fake zoom, open current file in a new tab
  ["ntz"] = { ":tabnew %<CR>" },

  -- Buffers
  ["n+"] = { ":bn<CR>" },
  ["n_"] = { ":bp<CR>" },

  -- Diagnostics
  ["n<LocalLeader>dn"] = { ":lua vim.lsp.diagnostic.goto_next()<CR>" },
  ["n<LocalLeader>dp"] = { ":lua vim.lsp.diagnostic.goto_prev()<CR>" },

  -- Clear serach results
  ["n<esc>"] = { ":noh<CR>" },

  -- Spell
  ["n<F9>"]  = { ":setlocal spell! spelllang=en<CR>" },
  ["n<F10>"] = { ":setlocal spell! spelllang=fr<CR>" },

  -- Quickly move current line or visual selection
  -- ["nmm"] = { ":<c-u>execute 'move -1-'. v:count1<CR>" },
  -- ["nMM"] = { ":<c-u>execute 'move +'. v:count1<CR>" },
  ["nmm"] = { ":m .+1<CR>==" },
  ["nMM"] = { ":m .-2<CR>==" },
  ["v<A-j>"] = { ":m '>+1<CR>gv=gv" },
  ["v<A-k>"] = { ":m '<-2<CR>gv=gv" },

  -- Get color group name of the syntax group where the cursor is
  ["n<F12>"] = { function()
    local line = vim.fn.line(".")
    local col = vim.fn.col(".")
    local group = vim.fn.synID(line, col, 1)
    local id_attr = vim.fn.synIDattr(group, "name")
    local id_trans = vim.fn.synIDtrans(group)

    print(id_attr .. " -> " .. vim.fn.synIDattr(id_trans, "name"))
  end
},

  -- Toggle between number and relative number
  ["n<Leader>à"] = { function()
    if vim.wo["relativenumber"] then
      vim.wo["relativenumber"] = false
      vim.wo["number"] = true
    else
      vim.wo["relativenumber"] = true
    end
  end
},

  -- Term
  -- Copy, move or delete the first occurence of the search
  -- e.g. /word$t
  ["c$t"] = { "<CR>:t''<CR>" },
  ["c$T"] = { "<CR>:T''<CR>" },
  ["c$m"] = { "<CR>:m''<CR>" },
  ["c$M"] = { "<CR>:M''<CR>" },
  ["c$d"] = { "<CR>:d<CR>``" },

}
util.bind_key(mapping)
