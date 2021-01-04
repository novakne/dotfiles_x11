local api = vim.api
local icons = require 'my.statusline.devicons'

local M = {}

-- Colors
local colors = {
  bg = '#38383c',
  mode_fg = '#232227',
  -- bg      = '#3e3350',
  fg = '#d2ccd6',
  -- mode_fg = '#29223a',
  normal = '#2dcbb0',
  insert = '#e8ec77',
  visual = '#fc65b0',
  command = '#57bbf4',
  term = '#f5939c',
  tab_sel = '#57bbf4',
  -- tab     = '#3e3350'
  tab = '#38383c',
}

-- Separators
local sep = {
  round = {left = '', right = ''},
  pixel = {
    left = ' ',
    right = ' ',
    -- left  = ' ',
    -- right = ' ',
  },
  fade = {left = '▒▓', right = '▓▒'},
}

local glyph = {
  modified = '',
  readonly = '',
  line = '',
  -- line     = '',
  col = '',
  -- col      = ' ',
  branch = '',
}

-- Mode
local current_mode = setmetatable({
  ['n'] = ' N ',
  ['no'] = 'N·Operator Pending ',
  ['v'] = ' V ',
  ['V'] = ' V·Line ',
  ['^V'] = ' V·Block ',
  ['s'] = ' S ',
  ['S'] = ' S·Line ',
  ['^S'] = ' S·Block ',
  ['i'] = ' I ',
  ['ic'] = ' I ',
  ['ix'] = ' I ',
  ['R'] = ' R ',
  ['Rv'] = ' V·Replace ',
  ['c'] = ' CMD ',
  ['cv'] = ' Vim Ex ',
  ['ce'] = ' Ex ',
  ['r'] = ' Prompt ',
  ['rm'] = ' More ',
  ['r?'] = ' Confirm ',
  ['!'] = ' Shell ',
  ['t'] = ' TERM ',
}, {
  -- fix weird issues
  __index = function(_, _) return 'V·Block' end,
})

-- Set Colors
-- Rectangle Color
local rect_bg = colors.bg
local rect_fg = colors.fg
vim.cmd('hi Rect guibg=' .. rect_bg .. ' guifg=' .. rect_fg)
vim.cmd('hi RectSeparator guifg=' .. rect_bg)

-- Sections
-- Constructors
local function sep_section(form, side)
  if side == 'left' then
    return '%#RectSeparator#' .. sep[form].left
  elseif side == 'right' then
    return '%#RectSeparator#' .. sep[form].right
  end
end

local function make_section(left, content, right)
  local fmt = '%s%s%s'
  local left_sep = sep_section(left, 'left')
  local right_sep = sep_section(right, 'right')
  return fmt:format(left_sep, content, right_sep)
end

-- File
local function is_modified()
  local modified = vim.bo.modified
  if not modified then return '' end
  return glyph.modified
end

local function is_readonly()
  local readonly = vim.bo.readonly
  if not readonly then return '' end
  return glyph.readonly
end

local function file_type()
  local filetype = api.nvim_buf_get_option(0, 'filetype')
  local icon = icons.deviconTable[filetype]
  if icon then return icon end
  return filetype
end

local function file_name()
  local fmt = '%%#Rect# %s %%f %s %s'
  local filename = fmt:format(file_type(), is_modified(), is_readonly())
  return filename
end

-- Lines / Columns
local function line_col()
  local total_line = api.nvim_buf_line_count(0)
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local fmt = '%%#Rect# %s %d/%d %s %d '
  return fmt:format(glyph.line, line, total_line, glyph.col, col)
end

-- Treesitter
local function ts_indic()
  local ts = vim.fn['nvim_treesitter#statusline'](90)
  local fmt = ('%%#TSStatus#%s '):format(ts)
  vim.cmd("hi TSStatus guifg='" .. colors.fg .. "'")
  return fmt
end

-- Modes
-- Redraw different colors for different mode
local function highlight(bg, fg)
  vim.cmd('hi Mode guibg=' .. bg .. ' guifg=' .. fg .. ' gui=bold')
  vim.cmd('hi ModeSeparator guifg=' .. bg)
end

local function redraw_colors(mode)
  if mode == 'n' then
    highlight(colors.normal, colors.mode_fg)
  elseif mode == 'i' then
    highlight(colors.insert, colors.mode_fg)
  elseif mode == 'v' or mode == 'V' or mode == '^V' then
    highlight(colors.visual, colors.mode_fg)
  elseif mode == 'c' then
    highlight(colors.command, colors.mode_fg)
  elseif mode == 't' then
    highlight(colors.term, colors.mode_fg)
  end
end

local function mode_section()
  local mode = api.nvim_get_mode()['mode']
  local c_mode = current_mode[mode]
  local fmt = '%%#ModeSeparator#%s%%#Mode#%s%%#ModeSeparator#%s'
  redraw_colors(mode)
  return fmt:format(sep.round.left, c_mode, sep.round.right)
end

-- Statusline active window
function M.active()
  local status = {}
  local left = {
    mode_section(),
    ' %<',
    make_section('pixel', file_name(), 'round'),
  }
  local right = {ts_indic(), make_section('round', line_col(), 'pixel')}
  status = table.concat(left) .. '%=' .. table.concat(right)
  return status
end

-- Statusline inactive window
function M.inactive()
  local sl = {make_section('pixel', file_name(), 'round')}
  return table.concat(sl)
end

-- FIXME I can't find a way to compare active and inactive windows
function M.set()
  local current_win = vim.call('winnr')
  if current_win then
    api.nvim_win_set_option(0, 'statusline', M.active())
  else
    api.nvim_win_set_option(0, 'statusline', M.inactive())
  end
end

-- Tabline
vim.cmd('hi TabLineSelSeparator guifg=' .. colors.tab_sel)
vim.cmd('hi TabLineSeparator guifg=' .. colors.tab)

local function get_tab_label(n)
  local current_win = api.nvim_tabpage_get_win(n)
  local current_buf = api.nvim_win_get_buf(current_win)
  local filename = api.nvim_buf_get_name(current_buf)
  if string.find(filename, 'term://') ~= nil then
    return ' ' .. api.nvim_call_function('fnamemodify', {filename, ':p:t'})
  end
  filename = api.nvim_call_function('fnamemodify', {filename, ':p:t'})
  if filename == '' then return 'No Name' end
  local icon = icons.deviconTable[filename]
  if icon ~= nil then return icon .. ' ' .. filename end
  return filename
end

function M.tabline()
  local tabline = ''
  local tab_list = api.nvim_list_tabpages()
  local current_tab = api.nvim_get_current_tabpage()
  for _, val in ipairs(tab_list) do
    local filename = get_tab_label(val)
    if val == current_tab then
      tabline = tabline .. '%#TabLineSelSeparator# ' .. sep.round.left
      tabline = tabline .. '%#TabLineSel# ' .. filename
      tabline = tabline .. ' %#TabLineSelSeparator#' .. sep.round.right
    else
      tabline = tabline .. '%#TabLineSeparator# ' .. sep.round.left
      tabline = tabline .. '%#TabLine# ' .. filename
      tabline = tabline .. ' %#TabLineSeparator#' .. sep.round.right
    end
  end
  return tabline
end

return M
