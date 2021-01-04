local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
local utils = require 'my.utils'

local M = {}

local function handler_init()
  vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = false,
      update_in_insert = false,
      -- Use a function to dynamically turn signs off
      -- and on, using buffer local variables
      signs = function(bufnr, client_id)
        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
        -- No buffer local variable set, so just enable by default
        if not ok then return true end

        return result
      end,
    })
end

local mapping = {
  ['nK'] = {':lua vim.lsp.buf.hover()<CR>'},
  ['n<LocalLeader>d'] = {':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'},
  ['ngd'] = {':lua vim.lsp.buf.declaration()<CR>'},
  ['n<LocaLeader>$'] = {':lua vim.lsp.buf.definition()<CR>'},
  ['ngD'] = {':lua vim.lsp.buf.implementation()<CR>'},
  ['n<LocalLeader>k'] = {':lua vim.lsp.buf.signature_help()<CR>'},
  ['n1gD '] = {':lua vim.lsp.buf.type_definition()<CR>'},
  ['ngr'] = {':lua vim.lsp.buf.references()<CR>'},
  ['ngs'] = {':lua vim.lsp.buf.document_symbol()<CR>'},
  ['n<LocalLeader>f'] = {':lua vim.lsp.buf.formatting()<CR>'},
}

local autocmd = {
  DiagnosticRefresh = {
    {'BufWinEnter,TabEnter', '<buffer>', 'lua require"my.lsp".handler_init()'},
  },
}

local function sign_define()
  vim.cmd [[ sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl= ]]
  vim.cmd [[ sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl= ]]
  vim.cmd [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl= ]]
  vim.cmd [[ sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl= ]]
end

local function on_attach(_, _)
  handler_init()
  utils.create_augroups(autocmd)
  utils.bind_key(mapping)
end

function M.init()
  local lua_dir = os.getenv('HOME') .. '/.local/share/lsp/lua-language-server/'
  local lua_bin = lua_dir .. 'bin/Linux/lua-language-server'
  local lua_main = lua_dir .. 'main.lua'

  -- SERVERS
  configs = {
    -- Bash
    bashls = {},
    -- Lua
    sumneko_lua = {
      cmd = {lua_bin, '-E', lua_main},
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim', 'awesome', 'client', 'tag', 'screen'},
          },
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
    -- Rust
    rust_analyzer = {
      settings = {
        ['rust-analyzer'] = {
          highlighting = {semanticTokens = true},
          highlightingOn = true,
          rainbowHighlightingOn = true,
        },
      },
    },
    -- Vim
    vimls = {},
  }

  for server, config in pairs(configs) do
    config.on_attach = on_attach
    lspconfig[server].setup(config)
  end

  sign_define()
end

return M
