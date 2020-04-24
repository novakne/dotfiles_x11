local vim = vim
local util = vim.lsp.util

local callback = {}

function callback.init()
  vim.lsp.callbacks["textDocument/publishDiagnostics"] = function(_, _, result)
    if not result then return end
    local uri = result.uri
    local bufnr = vim.uri_to_bufnr(uri)
    local diagnostics = result.diagnostics
    if not bufnr then
      vim.lsp.err_message("LSP.publishDiagnostics: Couldn't find buffer for ", uri)
      return
    end

    util.buf_clear_diagnostics(bufnr)
    util.buf_diagnostics_save_positions(bufnr, diagnostics)
    util.buf_diagnostics_signs(bufnr, diagnostics)

    -- FIXME Doesn't do anything
    if result and diagnostics then
      for _, v in ipairs(diagnostics) do
        v.uri = v.uri or result.uri
      end
      util.set_loclist(diagnostics)
    end

    vim.api.nvim_command("doautocmd User LspDiagnosticsChanged")
  end
end

return callback

