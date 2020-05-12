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
    -- { "WinEnter,BufEnter", "*", ":lua require'statusline'.set()" },
    -- { "WinLeave,BufLeave", "*", ":lua require'statusline'.set()" },
    { "TabNew", "*", "setlocal tabline=%!statusline#TabLine()" }
  },
  Terminal = {
    { "TermOpen", "*", "lua require'plugins.toggle_term'.autocmd()" },
    { "TermEnter", "*", "startinsert!" }
  }
}

util.create_augroups(autocmd)

