-- Set colorscheme
vim.cmd('colorscheme aize-black-lua')

-- Load config
-- Neovim general settings
local options = require("options")
local mappings = require("mappings")
local autocmd = require("autocmd")
-- Plugins settings
local plugins = require("plugins")
local plugins_mappings = require("plugins.mappings")
-- Lsp
local ok, _ = pcall(require, "lspconfig")
if not ok then return end
local lsp_config = require("lsp_config").init()

return {
  options = options,
  mappings = mappings,
  autocmd = autocmd,
  plugins = plugins,
  plugins_mappings = plugins_mappings,
	lsp_config = lsp_config,
}
