local nvim_lsp = require("nvim_lsp")
local util = require("util")
-- local callback = require("lsp_config.callback")

local lsp_config = {}

local mapping = {
  ["nK"] = { ":lua vim.lsp.buf.hover()<CR>" },
  ["n<Leader>d"] = { ":lua vim.lsp.util.show_line_diagnostics()<CR>" },
  ["ngd"] = { ":lua vim.lsp.buf.declaration()<CR>" },
  ["n<c-]>"] = { ":lua vim.lsp.buf.definition()<CR>" },
  ["ngD"] = { ":lua vim.lsp.buf.implementation()<CR>" },
  ["n<A-k>"] = { ":lua vim.lsp.buf.signature_help()<CR>" },
  ["n1gD "] = { ":lua vim.lsp.buf.type_definition()<CR>" },
  ["ngr"] = { ":lua vim.lsp.buf.references()<CR>" },
  ["ng0"] = { ":lua vim.lsp.buf.document_symbol()<CR>" }
}

local autocmd = {
  DiagnosticRefresh = {
    -- { "BufWinEnter,TabEnter", "<buffer>", "lua require'lsp_config.callback.init()'" },
    { "CursorHold", "*", "lua vim.lsp.util.show_line_diagnostics()" }
  }
}

local function on_attach(_, _)
   -- callback.init()
   util.create_augroups(autocmd)
   util.bind_key(mapping)
 end

function lsp_config.init()
  local lua_dir  = os.getenv("HOME") .. "/.local/share/nvim_lsp/lua-language-server/"
  local lua_bin  = lua_dir .. "bin/Linux/lua-language-server"
  local lua_main = lua_dir .. "main.lua"

  -- SERVERS
  local configs = {
    -- Bash
    bashls = {},
    -- Lua
    sumneko_lua = {
      cmd = { lua_bin, "-E", lua_main },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "awesome", "client", "tag", "screen" }
          }
        }
      }
    },
    -- Rust
    rust_analyzer = {
      settings = {
        ["rust-analyzer"] = {
          highlighting = {
            semanticTokens = true,
          },
          highlightingOn = true,
          rainbowHighlightingOn = true,
        }
      }
    },
    -- Vim
    vimls = {}
  }

  for server, config in pairs(configs) do
    config.on_attach = on_attach
    nvim_lsp[server].setup(config)
  end
end

return lsp_config
