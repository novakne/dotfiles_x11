local vim = vim
local util = {}

-- Lot of inspiration from https://github.com/norcalli/nvim_utils

-- Create augroup
function util.create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{"autocmd", def}, " ")
      vim.cmd(command)
    end
    vim.cmd("augroup END")
  end
end

-- Bind key
local function escape_keymap(key)
  -- Prepend with a letter so it can be used as a dictionary key
  return 'k'..key:gsub('.', string.byte)
end

local valid_mode = {
  c = "c",
  i = "i",
  n = "n",
  o = "o",
  t = "t",
  v = "v",
  x = "x"
}

BIND_FUNC = {}

function util.bind_key(map)
  for key, value in pairs(map) do
    local mode, lhs = key:match("^(.)(.+)$")
    local rhs = value[1]
    local default_opts = {}

    if not valid_mode[mode] then
      assert(false, "Not a valid mode " .. mode)
    end
    mode = valid_mode[mode]

    if #value > 1 then
      default_opts = vim.tbl_extend("force", default_opts, value[2])
    else
      default_opts = { noremap = true, silent = true }
    end

    if type(rhs) == "function" then
      local escaped = escape_keymap(key)
      BIND_FUNC[escaped] = rhs
      rhs = (":lua BIND_FUNC.%s()<CR>"):format(escaped)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, default_opts)
  end
end


-- Toggle between relativenumber and number
-- function util.toggle_number()
--   if vim.wo["relativenumber"] then
--     vim.wo["relativenumber"] = false
--     vim.wo["number"] = true
--   else
--     vim.wo["relativenumber"] = true
--   end
-- end

-- Be aware of whether you are right or left vertical split
-- so you can use arrows more naturally.
-- Inspired by https://github.com/ethagnawl
function util.vertical_resize(direction)
  local window_resize_count = 5
  local current_window = vim.call("winnr")
  local last_window = vim.call("winnr", "$")
  local modifier, modifier_1, modifier_2 = nil

  if direction == "left" then
    modifier_1, modifier_2 = "+", "-"
  else
    modifier_1, modifier_2 = "-", "+"
  end

  if current_window == last_window then
    local current_window_is_last_window = true
    if current_window_is_last_window then
      modifier = modifier_1
    else
      modifier = modifier_2
    end
  else
    modifier = modifier_2
  end

  local cmd = ("vertical resize %s%d<CR>"):format(modifier, window_resize_count)

  vim.cmd(cmd)
end

-- Move to the split in the direction shown, or create a new split
-- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
function util.win_move(key)
  local current_window = vim.call("winnr")
  vim.cmd("wincmd "..key)
  if current_window == vim.call("winnr") then
    if string.find(key, "[jk]") then
      vim.cmd("wincmd s")
    else
      vim.cmd("wincmd v")
    end
    vim.cmd("wincmd "..key)
  end
end


-- Get color group name of the syntax group where the cursor is
-- function util.syntax_group()
--   local line = vim.fn["line"](".")
--   local col = vim.fn["col"](".")
--   local group = vim.fn["synID"](line, col, 1)
--   local id_attr = vim.fn["synIDattr"](group, "name")
--   local id_trans = vim.fn["synIDtrans"](group)

--   print(id_attr .. " -> " .. vim.fn["synIDattr"](id_trans, "name"))
-- end

-- Vim spelling suggestions with fzf
-- ( https://coreyja.com/vim-spelling-suggestions-fzf/ )
local fzf_spell_replace = function(word)
  vim.cmd("normal! \"_ciw" .. word)
end

function util.fzf_spell()
  local select_word = vim.call("expand", "<cword>")
  local suggestions = vim.call("spellsuggest", select_word)
  local fzf_opts = {
    source = suggestions,
    -- FIXME this cmd add a space before the new word
    -- TODO use the function above
    sink = 'normal! "_ciw',
    -- sink = fzf_spell_replace(),
    window = { width = 0.4, height = 0.6 }
  }
  vim.fn["fzf#run"](fzf_opts)
end

function util.ripgrep_fzf(query, fullscreen)
  local cmd_fmt = "rg --column --line-number --no-heading --color=always --smart-case %s || true"
  local cmd_init = string.format(cmd_fmt, string.gsub(query, query, "'%1'"))
  local cmd_reload = string.format(cmd_fmt, "{q}")
  local opts = {
    options = {
      "--phony",
      "--query",
      query,
      "--bind",
      "change:reload:" .. cmd_reload
    },
  }

  vim.fn["fzf#vim#grep"](cmd_init, 1, vim.fn["fzf#vim#with_preview"](opts), fullscreen)
end


return util
