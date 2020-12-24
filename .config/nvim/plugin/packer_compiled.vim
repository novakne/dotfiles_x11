" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["completion-buffers"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/completion-buffers"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    config = { "\27LJ\2\nÖ\1\0\0\3\0\a\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\1K\0\1\0\18 augroup END ( autocmd User GoyoLeave Limelight! ' autocmd User GoyoEnter Limelight \15 autocmd! \23 augroup GoyoMode \bcmd\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nnn.vim"] = {
    commands = { "Np", "NnnPicker" },
    config = { "\27LJ\2\n†\2\0\0\b\0\n\0\0175\0\3\0005\1\1\0005\2\0\0=\2\2\1=\1\4\0005\1\5\0=\1\6\0006\1\a\0\18\3\0\0B\1\2\4H\4\3€6\6\b\0009\6\t\6<\5\4\6F\4\3\3R\4ûK\0\1\0\6g\bvim\npairs\15nnn#action\1\0\3\n<c-v>\vvsplit\n<c-h>\nsplit\n<c-t>\14tab split\15nnn#layout\1\0\2\29nnn#set_default_mappings\3\0\16nnn#command\vnnn -e\vwindow\1\0\0\1\0\3\nwidth\4\0€€€ÿ\3\14highlight\nDebug\vheight\4³æÌ™\3³æŒÿ\3\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/nnn.vim"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/rainbow_parentheses.vim"
  },
  ["vim-bbye"] = {
    commands = { "Bdelete" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/vim-bbye"
  },
  ["vim-easy-align"] = {
    commands = { "EasyAlign" },
    keys = { { "", "<Plug>(EasyAlign)" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-vsnip"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/novakane/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: completion-nvim
loadstring("\27LJ\2\n¾\4\0\0\b\0\22\00036\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0015\0\18\0005\1\n\0004\2\5\0005\3\6\0>\3\1\0025\3\a\0>\3\2\0025\3\b\0>\3\3\0025\3\t\0>\3\4\2=\2\v\0014\2\6\0005\3\f\0>\3\1\0025\3\r\0>\3\2\0025\3\14\0>\3\3\0025\3\15\0>\3\4\0025\3\16\0>\3\5\2=\2\17\1=\1\19\0006\1\20\0\18\3\0\0B\1\2\4H\4\3€6\6\0\0009\6\21\6<\5\4\6F\4\3\3R\4ûK\0\1\0\6g\npairs#completion_chain_complete_list\1\0\3\30completion_enable_snippet\14vim-vsnip!completion_enable_auto_paren\3\1\"completion_auto_change_source\3\1\tmode\1\2\0\0\ttags\1\2\0\0\tline\1\2\0\0\tfile\1\2\0\0\n<c-n>\1\2\0\0\n<c-p>\21completion_items\1\0\0\1\2\0\0\tpath\1\2\0\0\fbuffers\1\2\0\0\fsnippet\1\2\0\0\blsp\18 augroup END = autocmd BufEnter * lua require'completion'.on_attach() \15 autocmd! \23 augroup Complete \bcmd\bvim\0")()
-- Config for: vim-gutentags
loadstring("\27LJ\2\nC\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\18~/.cache/tags\24gutentags_cache_dir\6g\bvim\0")()
-- Config for: editorconfig-vim
loadstring("\27LJ\2\nQ\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\22['fugitive://.*']\"EditorConfig_exclude_patterns\6g\bvim\0")()
-- Config for: vim-floaterm
loadstring("\27LJ\2\n:\0\0\2\0\3\1\0056\0\0\0009\0\1\0*\1\0\0=\1\2\0K\0\1\0\19floaterm_width\6g\bvimµæÌ™\19™³¦ÿ\3\0")()
-- Config for: vim-signify
loadstring("\27LJ\2\nþ\1\0\0\b\0\4\0\v5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\3€6\6\2\0009\6\3\6<\5\4\6F\4\3\3R\4ûK\0\1\0\6g\bvim\npairs\1\0\a\30signify_sign_changedelete\6~\21signify_vcs_list\22[ 'git', 'yadm' ]\28signify_sign_show_count\3\1\24signify_sign_change\aÂ»#signify_sign_delete_first_line\6-\24signify_sign_delete\bâœ—\21signify_sign_add\6+\0")()
-- Config for: vim-sneak
loadstring("\27LJ\2\n-\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\16sneak#label\6g\bvim\0")()
-- Config for: fzf.vim
loadstring("\27LJ\2\nâ\1\0\0\b\0\n\0\0175\0\3\0005\1\1\0005\2\0\0=\2\2\1=\1\4\0005\1\5\0=\1\6\0006\1\a\0\18\3\0\0B\1\2\4H\4\3€6\6\b\0009\6\t\6<\5\4\6F\4\3\3R\4ûK\0\1\0\6g\bvim\npairs\15fzf_action\1\0\3\vctrl-v\vvsplit\vctrl-h\nsplit\vctrl-t\14tab split\15fzf_layout\1\0\1\21fzf_buffers_jump\3\1\vwindow\1\0\0\1\0\2\nwidth\4š³æÌ\t™³¦ÿ\3\vheight\4Í™³æ\fÌ™³ÿ\3\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file ColorizerToggle call s:load(['nvim-colorizer.lua'], { "cmd": "ColorizerToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Goyo call s:load(['goyo.vim'], { "cmd": "Goyo", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file NnnPicker call s:load(['nnn.vim'], { "cmd": "NnnPicker", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file EasyAlign call s:load(['vim-easy-align'], { "cmd": "EasyAlign", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Bdelete call s:load(['vim-bbye'], { "cmd": "Bdelete", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Np call s:load(['nnn.vim'], { "cmd": "Np", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads
noremap <silent> <Plug>(EasyAlign) <cmd>call <SID>load(['vim-easy-align'], { "keys": "<Plug>(EasyAlign)", "prefix": "" })<cr>

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType clojure ++once call s:load(['rainbow_parentheses.vim'], { "ft": "clojure" })
  au FileType fennel ++once call s:load(['rainbow_parentheses.vim'], { "ft": "fennel" })
  au FileType markdown ++once call s:load(['markdown-preview.nvim'], { "ft": "markdown" })
  " Event lazy-loads
  au InsertEnter * ++once call s:load(['completion-buffers', 'vim-vsnip', 'vim-vsnip-integ'], { "event": "InsertEnter *" })
augroup END
