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
local sep = {
  left = "",
  -- left = " ",
  -- left = " ",
  -- left = "▒▓",
  -- right = "",
  right = " ",
  -- right = " ",
  -- right = "▓▒",
  blank = " "
}

local glyph = {
  modified = "  ",
  readonly = "  ",
  line = "",
  -- line = "",
  col = "",
  -- col = " ",
  branch = ""
}

-- Mode
local current_mode = setmetatable({
      ["n"]  = "N",
      ["no"] = "N·Operator Pending",
      ["v"]  = "V",
      ["V"]  = "V·Line",
      ["^V"] = "V·Block",
      ["s"]  = "S",
      ["S"]  = "S·Line",
      ["^S"] = "S·Block",
      ["i"]  = "I",
      ["ic"] = "I",
      ["ix"] = "I",
      ["R"]  = "R",
      ["Rv"] = "V·Replace",
      ["c"]  = "CMD",
      ["cv"] = "Vim Ex",
      ["ce"] = "Ex",
      ["r"]  = "Prompt",
      ["rm"] = "More",
      ["r?"] = "Confirm",
      ["!"]  = "Shell",
      ["t"]  = "TERM"
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
    return glyph.modified
  else
    return ""
  end
end

local function is_readonly()
  local readonly = vim.bo.readonly
  if readonly then
    return glyph.readonly
  else
    return ""
  end
end

local function file_name()
  local filetype = api.nvim_buf_get_option(0, "filetype")
  local icon = icons.deviconTable[filetype]
  local file = "  %f "  .. is_modified() .. is_readonly()
  if icon ~= nil then
    return icon .. file
  end
  return filetype .. file
end

-- Git branch with Fugitive
local function git_branch()
  local branch = vim.fn["fugitive#head"]()
  if branch ~= "" then
    return ("%%#BaseStatus#%s %s"):format(glyph.branch, branch)
  else
    return ""
  end
end

local function line_col()
  local total_line = api.nvim_buf_line_count(0)
  local line = vim.fn["line"](".")
  local col = vim.fn["col"](".")
  local fmt = "%%#BaseStatus# %s %d/%d %s %d "
  return fmt:format(glyph.line, line, total_line, glyph.col, col)
end

local function sep_rect(side)
  if side == "left" then
    return "%#RrSeparator#" .. sep.left
  elseif side == "right" then
    return "%#RrSeparator#" .. sep.right
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
local function highlight(bg, fg)
  vim.cmd("hi Mode guibg="..bg.." guifg="..fg.." gui=bold")
  vim.cmd("hi ModeSeparator guifg="..bg)
end

local function redraw_colors(mode)
  if mode == "n" then
    highlight(colors.green, colors.dark)
  elseif mode == "i" then
    highlight(colors.yellow, colors.dark)
  elseif mode == "v" or mode == "V" or mode == "^V" then
    highlight(colors.pink, colors.dark)
  elseif mode == "c" then
    highlight(colors.blue, colors.dark)
  elseif mode == "t" then
    highlight(colors.orange, colors.dark)
  end
end


-- Statusline active window
function status.active_line()
  local statusline = ""

  -- LEFT --
  -- Mode
  local mode = api.nvim_get_mode()["mode"]
  redraw_colors(mode)
  statusline = statusline
    .. "%#ModeSeparator#" .. sep.left
    .. "%#Mode# " .. current_mode[mode]
    .. " %#ModeSeparator#" .. sep.right
  statusline = statusline .. sep.blank
  statusline = statusline .. "%<"

  -- Filename
  statusline = statusline
    .. sep_rect("left")
    .. "%#RRectangle# " .. file_name()
    .. sep_rect("right")

  -- RIGHT --
  statusline = statusline .. "%="
  -- Git Branch
  statusline = statusline .. git_branch()
  -- Row / Col
  statusline = statusline .. line_col()

  return statusline
end

-- Statusline inactive window
function status.inactive_line()
  local fmt = "%s%%#RRectangle# %%f %s"
  return fmt:format(sep_rect("left"), sep_rect("right"))
end


-- Tabline
vim.cmd("hi TabLineSelSeparator guifg=" .. colors.blue)
vim.cmd("hi TabLineSeparator guifg=" .. colors.dark_l)

local function get_tab_label(n)
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
      tabline = tabline .. "%#TabLineSelSeparator# " .. sep.left
      tabline = tabline .. "%#TabLineSel# " .. filename
      tabline = tabline .. " %#TabLineSelSeparator#" .. sep.right
    else
      tabline = tabline .. "%#TabLineSeparator# " .. sep.left
      tabline = tabline .. "%#TabLine# " .. filename
      tabline = tabline .. " %#TabLineSeparator#" .. sep.right
    end
  end
  return tabline
end

return status
