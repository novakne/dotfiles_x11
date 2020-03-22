local vim = vim
local M = {}

M.diagnostics_by_buffer = {}

function M.diagnostics_callback()
  local callback = 'textDocument/publishDiagnostics'
  vim.lsp.callbacks[callback] = function(_, _, result, _)
    if not result then return end
    local uri = result.uri
    local bufnr = vim.uri_to_bufnr(uri)
    if not bufnr then
      vim.lsp.err_message("LSP.publishDiagnostics: Couldn't find buffer for ", uri)
      return
    end
    M.diagnostics_by_buffer[bufnr] = result
    M.publish_diagnostics(bufnr)
  end
end

function M.publish_diagnostics(bufnr)
  local result = M.diagnostics_by_buffer[bufnr]
  if result == nil then return end
  vim.lsp.util.buf_clear_diagnostics(bufnr)
  vim.lsp.util.buf_diagnostics_save_positions(bufnr, result.diagnostics)
  vim.lsp.util.buf_diagnostics_signs(bufnr, result.diagnostics)
  M.diagnostics_location(result)
  vim.cmd("doautocmd User LspDiagnosticsChanged")
end

function M.diagnostics_refresh()
  local bufnr = vim.api.nvim_win_get_buf(0)
  M.publish_diagnostics(bufnr)
end

local function sort_by_key(fn)
  return function(a,b)
    local ka, kb = fn(a), fn(b)
    assert(#ka == #kb)
    for i = 1, #ka do
      if ka[i] ~= kb[i] then
        return ka[i] < kb[i]
      end
    end
    -- every value must have been equal here, which means it's not less than.
    return false
  end
end

local position_sort = sort_by_key(function(v)
  return {v.start.line, v.start.character}
end)

-- Returns the items with the byte position calculated correctly and in sorted
-- order.
function M.locations_to_items(locations)
  local items = {}
  local grouped = setmetatable({}, {
    __index = function(t, k)
      local v = {}
      rawset(t, k, v)
      return v
    end;
  })
  for _, d in ipairs(locations) do
    local start = d.range.start
    local fname = assert(vim.uri_to_fname(d.uri))
    table.insert(grouped[fname], {start = start, msg= d.message })
  end


  local keys = vim.tbl_keys(grouped)
  table.sort(keys)
  -- TODO(ashkan) I wish we could do this lazily.
  for _, fname in ipairs(keys) do
    local rows = grouped[fname]

    table.sort(rows, position_sort)
    local i = 0
    for line in io.lines(fname) do
      for _, temp in ipairs(rows) do
        local pos = temp.start
        local row = pos.line
        if i == row then
          local col
          if pos.character > #line then
            col = #line
          else
            col = vim.str_byteindex(line, pos.character)
          end
          table.insert(items, {
            filename = fname,
            lnum = row + 1,
            col = col + 1;
	    text = temp.msg;
          })
        end
      end
      i = i + 1
    end
  end
  return items
end

function M.diagnostics_location(local_result)
  if local_result and local_result.diagnostics then
    for _, v in ipairs(local_result.diagnostics) do
      v.uri = v.uri or local_result.uri
    end
  end

  vim.fn.setloclist(0, {}, ' ', {
      title = 'Language Server';
      items = M.locations_to_items(local_result.diagnostics)
    })
end


return M
