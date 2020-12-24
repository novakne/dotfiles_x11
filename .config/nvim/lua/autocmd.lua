local util = require("util")

local autocmd = {
  -- Auto close popup menu when finish completion
  CompletAuto = {
    { "CompleteDone", "*", "if pumvisible() == 0 | pclose | endif" }
  },
  -- Change statusline in active and inactive window
  StatusLine = {
    { "WinEnter,BufEnter", "*", "setlocal statusline=%!statusline#ActiveLine()" },
    { "WinLeave,BufLeave", "*", "setlocal statusline=%!statusline#InactiveLine()" },
    { "TabNew", "*", "setlocal tabline=%!statusline#TabLine()" }
  },
  HighlightYank = {
    { "TextYankPost", "*", "silent! lua require'vim.highlight'.on_yank {higroup='Comment', timeout=500}" }
  }
}

util.create_augroups(autocmd)

