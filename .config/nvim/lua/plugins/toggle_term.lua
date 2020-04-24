local vim = vim
local api = vim.api
local toggle_term = {}

local function term_open()
  if toggle_term.buf == nil or not api.nvim_buf_is_valid(toggle_term.buf) then
    vim.cmd("vnew")
    toggle_term.win = api.nvim_tabpage_get_win(0)
    toggle_term.buf = api.nvim_win_get_buf(0)
    toggle_term.jobID = vim.call("termopen", "$SHELL")
  else
    vim.cmd("vnew")
    toggle_term.win = api.nvim_tabpage_get_win(0)
    api.nvim_set_current_buf(toggle_term.buf)
  end
end

local function term_close()
  api.nvim_win_close(toggle_term.win, true)
end

function toggle_term.toggle()
    if toggle_term.buf == nil or not api.nvim_win_is_valid(toggle_term.win) then
    term_open()
  else
    term_close()
  end
end

function toggle_term.autocmd()
  vim.cmd("augroup TerminalOptions")
  vim.cmd("autocmd!")
  vim.cmd("autocmd BufEnter <buffer> startinsert!")
  vim.cmd("autocmd BufLeave <buffer> stopinsert!")
  vim.cmd("setlocal listchars= nonumber norelativenumber")
  vim.cmd("startinsert!")
  vim.cmd("augroup END")
end

return toggle_term
