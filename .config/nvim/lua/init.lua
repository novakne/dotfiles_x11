local config = require("config")
local lsp_config = require("lsp_config").init()
local colorizer = require("colorizer").setup()

return {
  config = config,
  lsp_config = lsp_config,
  colorizer = colorizer
}
