local nvim_lsp = require("nvim_lsp")
local completion = require("completion")

local lsp_dir = os.getenv("HOME") .. "/.local/share/nvim_lsp/"

-- SERVERS
-- Bash
nvim_lsp.bashls.setup{}

-- Lua
nvim_lsp.sumneko_lua.setup{
  cmd = {
    lsp_dir .. "lua-language-server/bin/Linux/lua-language-server",
    "-E",
    lsp_dir .. "lua-language-server/main.lua"
  },
  on_attach = completion.on_attach
}

-- Rust
nvim_lsp.rust_analyzer.setup{
  on_attach = completion.on_attach
}

-- Vim
nvim_lsp.vimls.setup{
  on_attach = completion.on_attach
}

