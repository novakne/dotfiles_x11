local vim = vim
local util = {}

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

-- Set keymap
function util.bind_key(mode, key, cmd, opts)
  opts = opts or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

return util
