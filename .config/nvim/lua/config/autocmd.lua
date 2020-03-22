local util = require "util"


local autocmd = {
  -- Auto close popup menu when finish completion
  CompletAuto = {
    { "CompleteDone", "*", "if pumvisible() == 0 | pclose | endif" }
  },
  -- Launch Limelight with Goyo
  GoyoMode = {
    { "User", "GoyoEnter", "Limelight" },
    { "User", "GoyoLeave", "Limelight!" }
  },
  -- Change statusline in active and inactive window
  StatusLine = {
    { "WinEnter,BufEnter", "*", "setlocal statusline=%!statusline#ActiveLine()" },
    { "WinLeave,BufLeave", "*", "setlocal statusline=%!statusline#InactiveLine()" }
  }
}

util.create_augroups(autocmd)

