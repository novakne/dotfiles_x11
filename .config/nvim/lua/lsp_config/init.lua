local vim = vim
local nvim_lsp = require("nvim_lsp")
local diagnostics = require("lsp_config.diagnostics")
diagnostics.diagnostics_callback()
local util = require("util")

-- Signs in sign column
vim.g.LspDiagnosticsErrorSign       = ""
vim.g.LspDiagnosticsWarningSign     = ""
vim.g.LspDiagnosticsInformationSign = ""
vim.g.LspDiagnosticsHintSign        = ""

util.bind_key("n", "K", ":lua vim.lsp.buf.hover()<CR>")
util.bind_key("n", "<Leader>d", ":lua vim.lsp.util.show_line_diagnostics()<CR>")
util.bind_key("n", "gd", ":lua vim.lsp.buf.declaration()<CR>")
util.bind_key("n", "<c-]>", ":lua vim.lsp.buf.definition()<CR>")
util.bind_key("n", "gD", ":lua vim.lsp.buf.implementation()<CR>")
util.bind_key("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>")
util.bind_key("n", "1gD ", ":lua vim.lsp.buf.type_definition()<CR>")
util.bind_key("n", "gr", ":lua vim.lsp.buf.references()<CR>")
util.bind_key("n", "g0", ":lua vim.lsp.buf.document_symbol()<CR>")

local on_attach = function(_, _)
  vim.cmd("augroup DiagnosticRefresh")
  vim.cmd("autocmd!")
  vim.cmd("autocmd BufWinEnter,TabEnter <buffer> lua require'lsp_config.diagnostics'.diagnostics_refresh()")
  vim.cmd("autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()")
  vim.cmd("augroup END")
end

-- Orverride default config
nvim_lsp.util.default_config = vim.tbl_extend(
  "force",
  nvim_lsp.util.default_config,
  { on_attach = on_attach }
)

-- SERVERS
-- Bash
nvim_lsp.bashls.setup{}

-- Lua
local lua_dir  = os.getenv("HOME") .. "/.local/share/nvim_lsp/lua-language-server/"
local lua_bin  = lua_dir .. "bin/Linux/lua-language-server"
local lua_main = lua_dir .. "main.lua"

nvim_lsp.sumneko_lua.setup{
  cmd = { lua_bin, "-E", lua_main },
  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim", "awesome", "client", "tag" }
      }
    }
  }
}

-- Rust
nvim_lsp.rust_analyzer.setup{
  -- FIXME
  -- settings = {
  --   rust-analyzer = {
  --     highlighting = {
	-- semanticTokens = true,
  --     },
  --     highlightingOn = true,
  --     rainbowHighlightingOn = true,
  --   }
  -- }
}

-- Vim
nvim_lsp.vimls.setup{}
