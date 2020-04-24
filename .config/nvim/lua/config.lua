local options = require("config.options")
local mappings = require("config.mappings")
local autocmd = require("config.autocmd")

local config = {
  options  = options,
  mappings = mappings,
  autocmd  = autocmd
}

return config
