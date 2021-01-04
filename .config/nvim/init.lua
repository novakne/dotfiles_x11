-- Load config

-- Neovim general settings
local options  = require 'my.options'
local mappings = require 'my.mappings'
local autocmd  = require 'my.autocmd'

-- Plugins settings
local plugins = require 'my.plugins'
local plugins_mappings = require 'my.plugins.mappings'

return {
  options = options,
  mappings = mappings,
  autocmd = autocmd,
  plugins = plugins,
  plugins_mappings = plugins_mappings,
}
