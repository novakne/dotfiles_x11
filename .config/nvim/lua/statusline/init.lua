local api = vim.api
local icons = require("statusline.devicons")

local status = {}

-- Colors
local colors = {
  dark    = "#29223a",
  dark_l  = "#3e3350",
  dark_l2 = "#534666",
  aize03  = "#6b5c7c",
  aize04  = "#837593",
  aize05  = "#9d8fa9",
  white_d = "#b7acbf",
  white   = "#d2ccd6",
  red     = "#f63d81",
  pink    = "#fc65b0",
  orange  = "#f5939c",
  yellow  = "#e8ec77",
  green   = "#2dcbb0",
  blue    = "#57bbf4",
  magenta = "#a89bee",
  cyan    = "#4db9c8"
}

-- Separators
local separators = {
  left = "▒▓",
  right = "▓▒",
  -- left = "",
  -- right = "",
  blank = " "
}

-- Mode
local current_mode = setmetatable({
      ["n"]  = "NORMAL",
      ["no"] = "N·Operator Pending",
      ["v"]  = "VISUAL",
      ["V"]  = "V·Line",
      ["^V"] = "V·Block",
      ["s"]  = "Select",
      ["S"]  = "S·Line",
      ["^S"] = "S·Block",
      ["i"]  = "INSERT",
      ["ic"] = "INSERT",
      ["ix"] = "INSERT",
      ["R"]  = "Replace",
      ["Rv"] = "V·Replace",
      ["c"]  = "COMMAND",
      ["cv"] = "Vim Ex",
      ["ce"] = "Ex",
      ["r"]  = "Prompt",
      ["rm"] = "More",
      ["r?"] = "Confirm",
      ["!"]  = "Shell",
      ["t"]  = "TERMINAL"
    }, {
      -- fix weird issues
      __index = function(_, _)
        return "V·Block"
      end
    }
)


-- Functions
-- Files
local function is_modified()
  local modified = vim.bo.modified
  if modified then
    return "  "
  else
    return " "
  end
end

local function is_readonly()
  local readonly = vim.bo.readonly
  if readonly then
    return "  "
  else
    return ""
  end
end

local file_name = function()
  local filename = api.nvim_call_function("expand", {"%f"})
  local filetype = api.nvim_buf_get_option(0, "filetype")
  local icon = icons.deviconTable[filetype]
  local file = " " .. filename .. is_modified() .. is_readonly()
  if icon ~= nil then
    return icon .. file
  end
  return filetype .. file
end

-- Git branch  with Fugitive
local function git_branch()
  local branch = vim.fn["fugitive#head"]()
  if branch ~= nil then
    return " " .. branch
  else
    return ""
  end
end

-- Default Color Highlight
-- Round Rectangle Color
local rr_bg = colors.dark_l
local rr_fg = colors.white
vim.cmd("hi RRectangle guibg=" .. rr_bg .. " guifg=" .. rr_fg)
vim.cmd("hi RrSeparator guifg=" .. rr_bg)

-- Base Color
local base_bg = "None"
local base_fg = colors.white
vim.cmd("hi BaseStatus guibg=" .. base_bg .. " guifg=" .. base_fg)

-- Redraw different colors for different mode
local RedrawColors = function(mode)
  if mode == "n" then
    vim.cmd("hi Mode guibg="..colors.green.." guifg="..colors.dark.." gui=bold")
    vim.cmd("hi ModeSeparator guifg="..colors.green)
  end
  if mode == "i" then
    vim.cmd("hi Mode guibg="..colors.yellow.." guifg="..colors.dark.." gui=bold")
    vim.cmd("hi ModeSeparator guifg="..colors.yellow)
  end
  if mode == "v" or mode == "V" or mode == "^V" then
    vim.cmd("hi Mode guibg="..colors.pink.." guifg="..colors.dark.." gui=bold")
    vim.cmd("hi ModeSeparator guifg="..colors.pink)
  end
  if mode == "c" then
    vim.cmd("hi Mode guibg="..colors.blue.." guifg="..colors.dark.." gui=bold")
    vim.cmd("hi ModeSeparator guifg="..colors.blue)
  end
  if mode == "t" then
    vim.cmd("hi Mode guibg="..colors.orange.." guifg="..colors.dark.." gui=bold")
    vim.cmd("hi ModeSeparator guifg="..colors.orange)
  end
end


-- Statusline active window
function status.activeLine()
  local statusline = ""

  -- LEFT --
  -- Mode
  local mode = api.nvim_get_mode()["mode"]
  RedrawColors(mode)
  statusline = statusline
    .. "%#ModeSeparator#" .. separators.left
    .. "%#Mode# " .. current_mode[mode]
    .. " %#ModeSeparator#" .. separators.right
  statusline = statusline .. separators.blank

  -- Filename
  statusline = statusline
    .. "%#RrSeparator#" .. separators.left
    .. "%#RRectangle# " .. file_name()
    .. "%#RrSeparator#" .. separators.right

  -- RIGHT --
  statusline = statusline .. "%="

  -- Git Branch
  statusline = statusline
    .. "%#BaseStatus#" .. git_branch()

  -- Row / Col
  local line = vim.fn["line"](".")
  local col = vim.fn["col"](".")
  statusline = statusline
    .. "%#BaseStatus#  " .. line
    .. "  " .. col .. " "

  return statusline
end

-- Statusline inactive window
function status.inactiveLine()
  local filename = api.nvim_call_function("expand", {"%f"})
  return "%#RrSeparator# " .. separators.left
    .. "%#RRectangle# " .. filename
    .. "%#RrSeparator#" .. separators.right
end


-- Tabline
vim.cmd("hi TabLineSelSeparator guifg=" .. colors.blue)
vim.cmd("hi TabLineSeparator guifg=" .. colors.dark_l)

local get_tab_label = function(n)
  local current_win = api.nvim_tabpage_get_win(n)
  local current_buf = api.nvim_win_get_buf(current_win)
  local filename = api.nvim_buf_get_name(current_buf)
  if string.find(filename, "term://") ~= nil then
    return " "..api.nvim_call_function("fnamemodify", {filename, ":p:t"})
  end
  filename = api.nvim_call_function("fnamemodify", {filename, ":p:t"})
  if filename == "" then
    return "No Name"
  end
  local icon = icons.deviconTable[filename]
  if icon ~= nil then
    return icon .. " " .. filename
  end
  return filename
end

function status.tabline()
  local tabline = ""
  local tab_list = api.nvim_list_tabpages()
  local current_tab = api.nvim_get_current_tabpage()
  for _, val in ipairs(tab_list) do
    local filename = get_tab_label(val)
    if val == current_tab then
      tabline = tabline .. "%#TabLineSelSeparator# " .. separators.left
      tabline = tabline .. "%#TabLineSel# " .. filename
      tabline = tabline .. " %#TabLineSelSeparator#" .. separators.right
    else
      tabline = tabline .. "%#TabLineSeparator# " .. separators.left
      tabline = tabline .. "%#TabLine# " .. filename
      tabline = tabline .. " %#TabLineSeparator#" .. separators.right
    end
  end
  return tabline
end

return status
