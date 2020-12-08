local config = require("config")
local ok, _ = pcall(require, "lspconfig")
if not ok then return end
local lsp_config = require("lsp_config").init()

return {
  config = config,
  lsp_config = lsp_config,
}
