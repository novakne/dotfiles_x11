local map = vim.api.nvim_set_keymap

local M = {}

function M.set_keys()

  -- Change leader key
  -- TODO

  local opts = {noremap = true, silent = true}

  -- Normal mode with 'jk' or 'kj'
  map('i', 'jk', '<esc>', opts )
  map('i', 'kj', '<esc>', opts )

  -- Move updown by visual (wrapped) lines
  -- TODO

  -- Easier start & end of the line
  map('n', 'H', '^', opts)
  map('n', 'L', '$', opts)

  -- Editing
  map('n', '<Leader>w', ':w<CR>', opts)
  map('n', '<Leader>z', ':q<CR>', opts)
  map('n', '<Leader>x', ':xa<CR>', opts)
  map('n', '<Leader>!', ':q!<CR>', opts)
  -- Easier for azerty
  map('n', ';', '.', opts)
  -- Apend ;/, at the end of the line
  map('n', '<Leader>;', '', opts)
  map('n', '<Leader>,', '', opts)
  -- Don't lose selection when shifting sidewards
  map('x', '<', '<gv', opts)
  map('x', '>', '>gv', opts)

  -- Windows
  -- Move to the split in the direction shown, or create a new split
  -- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
  map('n', '<C-h>', ':call util#WinMove("h")<CR>', opts)
  map('n', '<C-j>', ':call util#WinMove("j")<CR>', opts)
  map('n', '<C-k>', ':call util#WinMove("k")<CR>', opts)
  map('n', '<C-l>', ':call util#WinMove("l")<CR>', opts)
  -- Intelligent windows resizing using ctrl + arrow keys
  map('n', '<C-Right>', ':call util#intelligentVerticalResize("right")<CR>', opts)
  map('n', '<C-Left>', ':call util#intelligentVerticalResize("left")<CR>', opts)
  map('n', '<C-Up>', ':resize -1<CR>', opts)
  map('n', '<C-down>', ':resize +1<CR>', opts)

  -- Tabs
  map('n', 'tl', ':tabnext<CR>', opts)
  map('n', 'th', ':tabprev<CR>', opts)
  map('n', 'tn', ':tabnew<CR>', opts)
  -- Fake zoom, open current file in a new tab
  map('n', 'tz', ':tabnew %<CR>', opts)

  -- Buffers
  map('n', '+', ':bn<CR>', opts)
  map('n', '_', ':bp<CR>', opts)

  -- Clear serach results
  map('n', '<esc>', ':noh<CR>', opts)

  -- Spell
  map('n', '<F9>', '<Esc>:silent setlocal spell! spelllang=en<CR>', opts)
  map('n', '<F10>', '<Esc>:silent setlocal spell! spelllang=fr<CR>', opts)

  -- Quickly move current line
  map('n', 'mm', ':<c-u>execute "move -1-". v:count1<CR>', opts)
  map('n', 'MM', ':<c-u>execute "move +". v:count1<CR>', opts)

  -- Get color group name of the syntax group where the cursor is
  map('n', '<F12>', ':call util#SyntaxGroup()<CR>', opts)

  -- Toggle between number and relative number
  map('n', '<Leader>à', ':call number#ToggleNumber()<CR>', opts)

  -- Search helpers
  -- TODO

end

return M
