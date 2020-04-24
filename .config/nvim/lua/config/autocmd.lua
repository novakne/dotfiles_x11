local util = require("util")

local autocmd = {
  -- Auto close popup menu when finish completion
  CompletAuto = {
    { "CompleteDone", "*", "if pumvisible() == 0 | pclose | endif" }
  },
  -- Use completion-nvim in every buffer
  Complete = {
    { "BufEnter", "*", "lua require'completion'.on_attach()" }
  },
  -- Launch Limelight with Goyo
  GoyoMode = {
    { "User", "GoyoEnter", "Limelight" },
    { "User", "GoyoLeave", "Limelight!" }
  },
  -- Change statusline in active and inactive window
  StatusLine = {
    { "WinEnter,BufEnter", "*", "setlocal statusline=%!statusline#ActiveLine()" },
    { "WinLeave,BufLeave", "*", "setlocal statusline=%!statusline#InactiveLine()" },
    { "TabNew", "*", "setlocal tabline=%!statusline#TabLine()" }
  },
  Terminal = {
    { "TermOpen", "*", "lua require'plugins.toggle_term'.autocmd()" }
  }
}

util.create_augroups(autocmd)

