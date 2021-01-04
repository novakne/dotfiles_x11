-- Theme: Kosmikoa
-- Author: Novakane
local M = {}

local colors = {
  base00 = '#232227',
  base01 = '#38383c',
  base02 = '#4e4e52',
  base03 = '#6b5c7c',
  base04 = '#837593',
  base05 = '#9d8fa9',
  base06 = '#b7acbf',
  base07 = '#d2ccd6',
  red = '#f63d81',
  pink = '#fc65b0',
  orange = '#f5939c',
  yellow = '#e8ec77',
  green = '#2dcbb0',
  blue = '#57bbf4',
  magenta = '#a89bee',
  cyan = '#4db9c8',

  shadow = '#27262c',
}

-- Terminal
local term_colors = {
  terminal_color_0 = colors.base01,
  terminal_color_1 = colors.red,
  terminal_color_2 = colors.green,
  terminal_color_3 = colors.yellow,
  terminal_color_4 = colors.blue,
  terminal_color_5 = colors.magenta,
  terminal_color_6 = colors.cyan,
  terminal_color_7 = colors.base06,
  terminal_color_8 = colors.base02,
  terminal_color_9 = colors.red,
  terminal_color_10 = colors.green,
  terminal_color_11 = colors.yellow,
  terminal_color_12 = colors.blue,
  terminal_color_13 = colors.magenta,
  terminal_color_14 = colors.cyan,
  terminal_color_15 = colors.base07,
}

local function highlight(group, color)
  local guifg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local guibg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local attr = color.attr and 'gui=' .. color.attr or 'gui=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  local cmd = ('highlight %s %s %s %s %s'):format(group, guifg, guibg, attr, sp)

  vim.cmd(cmd)
end

function M.set_syntax()
  local syntax = {
    -- ___UI COMPONENTS___
    -- ( :so $VIMRUNTIME/syntax/hitest.vim )

    -- ATTRIBUTES
    Bold = {attr = 'bold'},
    Italic = {attr = 'italic'},
    Underline = {attr = 'underline'},

    -- EDITOR
    ColorColumn = {fg = colors.base01},
    Cursor = {fg = colors.base00, bg = colors.base06},
    CursorLine = {fg = colors.base01},
    Error = {fg = colors.red, bg = colors.base00},
    iCursor = {fg = colors.base00, bg = colors.base05},
    LineNr = {fg = colors.base02, bg = colors.base00},
    MatchParen = {fg = colors.green, bg = colors.base02},
    NonText = {fg = colors.base02},
    Normal = {fg = colors.base07, bg = colors.base00},
    PMenu = {fg = colors.base05, bg = colors.base01},
    PmenuSbar = {fg = colors.base05, bg = colors.base02},
    PMenuSel = {fg = colors.base01, bg = colors.green},
    PmenuThumb = {fg = colors.green, bg = colors.base02},
    SpecialKey = {fg = colors.base04},
    SpellBad = {
      fg = colors.red,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.red,
    },
    SpellCap = {
      fg = colors.pink,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.pink,
    },
    SpellLocal = {
      fg = colors.orange,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.orange,
    },
    SpellRare = {
      fg = colors.yellow,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.yellow,
    },
    Visual = {fg = colors.base01},
    VisualNOS = {fg = colors.base03},

    -- NEOVIM SUPPORT
    healthError = {fg = colors.red, bg = colors.base00},
    healthSuccess = {fg = colors.green, bg = colors.base00},
    healthWarning = {fg = colors.yellow, bg = colors.base00},
    TermCursorNC = {fg = colors.base01},

    -- GUTTER
    CursorColumn = {fg = colors.base01},
    CursorLineNr = {fg = colors.base05, bg = colors.base00},
    Folded = {fg = colors.base04, bg = colors.base01, attr = 'bold'},
    FoldColumn = {fg = colors.base03, bg = colors.base00},
    SignColumn = {fg = colors.base01, bg = colors.base00},

    -- NAVIGATION
    Directory = {fg = colors.green},

    -- PROMPT / STATUS
    EndOfBuffer = {fg = colors.base01},
    ErrorMsg = {fg = colors.base00, bg = colors.red},
    ModeMsg = {fg = colors.base04},
    MoreMsg = {fg = colors.base04},
    Question = {fg = colors.base04},
    StatusLine = {fg = colors.base05, bg = colors.base01},
    StatusLineNC = {fg = colors.base03, bg = colors.base01},
    StatusLineTerm = {fg = colors.base05, bg = colors.base01},
    StatusLineTermNC = {fg = colors.base03, bg = colors.base01},
    WarningMsg = {fg = colors.base00, bg = colors.yellow},
    WildMenu = {fg = colors.yellow, bg = colors.base01},

    -- SEARCH
    IncSearch = {fg = colors.base01, bg = colors.yellow, attr = 'underline'},
    Search = {fg = colors.base01, bg = colors.blue},

    -- TABS
    TabLine = {fg = colors.base04, bg = colors.base01},
    TabLineFill = {fg = colors.base04, bg = colors.base01},
    TabLineSel = {fg = colors.base00, bg = colors.blue},

    -- WINDOW
    Title = {fg = colors.base04},
    VertSplit = {fg = colors.base01, bg = colors.base00},

    -- DIFF
    DiffAdd = {fg = colors.green, bg = colors.base00, attr = 'inverse'},
    DiffChange = {fg = colors.yellow, bg = colors.base00, attr = 'inverse'},
    DiffDelete = {fg = colors.red, bg = colors.base00, attr = 'inverse'},
    DiffText = {fg = colors.blue, bg = colors.base00, attr = 'inverse'},
    -- Legacy groups for official git.vim and diff.vim syntax
    diffAdded = {fg = colors.green, bg = colors.base00, attr = 'inverse'},
    diffChanged = {fg = colors.yellow, bg = colors.base00, attr = 'inverse'},
    diffRemoved = {fg = colors.red, bg = colors.base00, attr = 'inverse'},

    -- QUICKFIX / LOCATION LIST
    qfLineNr = {fg = colors.base06},

    -- NEOVIM LSP
    LspDiagnosticsDefaultError = {fg = colors.red},
    LspDiagnosticsDefaultWarning = {fg = colors.yellow},
    LspDiagnosticsDefaultInformation = {fg = colors.blue},
    LspDiagnosticsDefaultHint = {fg = colors.green},

    -- ___LANGUAGE kosmikoa.base GROUPS___
    -- ( :help w18 )

    Comment = {fg = colors.base03, attr = 'italic'},

    Constant = {fg = colors.pink},
    String = {fg = colors.magenta, attr = 'italic'},
    Character = {fg = colors.pink},
    Number = {fg = colors.red},
    Boolean = {fg = colors.green},
    Float = {fg = colors.orange},

    Identifier = {fg = colors.blue},
    Function = {fg = colors.green},

    Statement = {fg = colors.magenta},
    Conditional = {fg = colors.blue},
    Repeat = {fg = colors.magenta},
    Label = {fg = colors.red},
    Operator = {fg = colors.blue},
    Keyword = {fg = colors.yellow},
    Exception = {fg = colors.red},

    PreProc = {fg = colors.magenta},
    Include = {fg = colors.cyan},
    Define = {fg = colors.blue},
    Macro = {fg = colors.yellow},
    PreCondit = {fg = colors.yellow},

    Type = {fg = colors.pink},
    StorageClass = {fg = colors.pink},
    Structure = {fg = colors.pink},
    Typedef = {fg = colors.blue},

    Special = {fg = colors.base05},
    SpecialChar = {fg = colors.blue},
    Tag = {fg = colors.base05},
    Delimiter = {fg = colors.base07},
    SpecialComment = {fg = colors.base05, attr = 'italic'},
    Todo = {fg = colors.blue},

    -- ___LANGUAGES SPECIFIC___

    -- CFG
    CfgValues = {fg = colors.blue},
    CfgSection = {fg = colors.green},

    -- CSS
    cssAttr = {fg = colors.yellow},
    cssAttributeSelector = {fg = colors.blue},
    cssBraces = {fg = colors.base01},
    cssClassName = {fg = colors.cyan},
    cssClassNameDot = {fg = colors.red},
    cssColor = {fg = colors.base01},
    cssDefinition = {fg = colors.base07},
    cssFontAttr = {fg = colors.magenta},
    cssImportant = {fg = colors.red},
    cssMediaType = {fg = colors.green},
    cssProp = {fg = colors.base07},
    cssPseudoClass = {fg = colors.base07},
    cssPseudoClassId = {fg = colors.blue},
    cssSelectorOp = {fg = colors.yellow},
    cssTagName = {fg = colors.blue},
    cssUnitDecorators = {fg = colors.orange},
    cssVendor = {fg = colors.yellow},

    -- FENNEL ( https://github.com/bakpakin/fennel.vim )
    FennelSpecialForm = {fg = colors.pink},
    FennelSymbol = {fg = colors.base07},
    FennelParen = {fg = colors.blue},

    -- GO
    goBuiltins = {fg = colors.cyan},
    goConstants = {fg = colors.yellow},

    -- HTML
    htmlLink = {fg = colors.blue},
    htmlArg = {fg = colors.base07},
    htmlBold = {attr = 'bold'},
    htmlEndTag = {fg = colors.blue},
    htmlH1 = {fg = colors.pink},
    htmlH2 = {fg = colors.pink},
    htmlH3 = {fg = colors.pink},
    htmlH4 = {fg = colors.pink},
    htmlH5 = {fg = colors.pink},
    htmlH6 = {fg = colors.pink},
    htmlItalic = {attr = 'italic'},
    htmlSpecialChar = {fg = colors.blue},
    htmlSpecialTagName = {fg = colors.pink},
    htmlTag = {fg = colors.blue},
    htmlTagN = {fg = colors.blue},
    htmlTagName = {fg = colors.blue},
    htmlTitle = {fg = colors.orange},

    -- JAVA
    javaCommentTitle = {fg = colors.base03, attr = 'italic'},
    javaDocTags = {fg = colors.base07},

    -- JAVASCRIPT
    -- ( http//github.com/pangloss/vim-javascript )
    jsGlobalNodeObjects = {fg = colors.red, attr = 'italic'},
    jsVariableDef = {fg = colors.base06, attr = 'italic'},
    jsFuncArgs = {fg = colors.base06, attr = 'italic'},
    jsArrowFunction = {fg = colors.yellow},
    jsBrackets = {fg = colors.base06},
    jsClassDefinition = {fg = colors.green},
    jsFuncCall = {fg = colors.green},
    jsFuncParens = {fg = colors.base06},
    jsGlobalObjects = {fg = colors.red},
    jsNoise = {fg = colors.base06},
    jsObjectProp = {fg = colors.cyan},
    jsPrototype = {fg = colors.yellow},
    jsRegexpString = {fg = colors.blue},
    jsReturn = {fg = colors.yellow},
    jsTemplateString = {fg = colors.yellow},
    jsThis = {fg = colors.yellow},

    -- JSX
    --  ( http//github.com/mxw/vim-jsx )
    xmlTag = {fg = colors.blue},
    xmlTagName = {fg = colors.blue},
    xmlEndTag = {fg = colors.blue},

    -- JSON
    jsonBraces = {fg = colors.blue},
    jsonKeyword = {fg = colors.base07},
    jsonKeywordMatch = {fg = colors.yellow},
    jsonNoise = {fg = colors.pink},

    -- LATEX
    -- (  http//github.com/lervag/vimtex )
    texStatement = {fg = colors.green},
    texUrl = {fg = colors.blue},

    -- LESS
    --  ( http//github.com/groenewege/vim-less )
    lessAmpersand = {fg = colors.yellow},
    lessClass = {fg = colors.base07},
    lessCssAttribute = {fg = colors.base06},
    lessFunction = {fg = colors.green},
    lessVariable = {fg = colors.pink},

    -- LUA
    luaFuncCall = {fg = colors.yellow},
    luaLocal = {fg = colors.cyan},
    luaFuncKeyword = {fg = colors.magenta},
    luaSpecialValue = {fg = colors.orange},
    luaStatement = {fg = colors.green},
    luaRepeat = {fg = colors.pink},
    luaConstant = {fg = colors.red},

    -- MARKDOWN
    markdownUrl = {fg = colors.base04},
    markdownBlockquote = {fg = colors.base07},
    markdownBold = {attr = 'bold'},
    markdownBoldDelimiter = {fg = colors.yellow},
    markdownCode = {fg = colors.base07},
    markdownCodeDelimiter = {fg = colors.base07},
    markdownFootnote = {fg = colors.base07},
    markdownFootnoteDefinition = {fg = colors.base07},
    markdownH1 = {fg = colors.pink},
    markdownH2 = {fg = colors.pink},
    markdownH3 = {fg = colors.pink},
    markdownH4 = {fg = colors.pink},
    markdownH5 = {fg = colors.pink},
    markdownH6 = {fg = colors.pink},
    markdownHeadingDelimiter = {fg = colors.yellow},
    markdownId = {fg = colors.base07},
    markdownIdDeclaration = {fg = colors.base07},
    markdownIdDelimiter = {fg = colors.yellow},
    markdownItalic = {attr = 'italic'},
    markdownItalicDelimiter = {fg = colors.yellow},
    markdownLinkDelimiter = {fg = colors.yellow},
    markdownLinkText = {fg = colors.red},
    markdownLinkTextDelimiter = {fg = colors.yellow},
    markdownListMarker = {fg = colors.yellow},
    markdownRule = {fg = colors.yellow},

    -- ( http//github.com/plasticboy/vim-markdown )
    mkdListItem = {fg = colors.yellow},
    mkdCode = {fg = colors.green},
    mkdHeading = {fg = colors.pink},
    mkdURL = {fg = colors.blue},

    -- PHP
    phpClasses = {fg = colors.base07},
    phpDocCustomTags = {fg = colors.base07},
    phpDocTags = {fg = colors.base07},
    phpMemberSelector = {fg = colors.yellow},

    -- PYTHON
    pythonBuiltin = {fg = colors.pink},
    pythonEscape = {fg = colors.blue},

    -- RUST
    -- ( http//github.com/rust-lang/rust.vim )
    rustArrowCharacter = {fg = colors.green},

    -- SCSS
    -- ( http//github.com/cakebaker/scss-syntax.vim )
    scssVariable = {fg = colors.pink},

    -- SHELL
    shCmdParenRegion = {fg = colors.base06},
    shCmdSubRegion = {fg = colors.base06},
    shDerefSimple = {fg = colors.blue},
    shDerefVar = {fg = colors.blue},

    -- VIM
    vimAugroup = {fg = colors.base07},
    vimCommand = {fg = colors.blue},
    vimFunc = {fg = colors.green},
    vimFunction = {fg = colors.green},
    vimMap = {fg = colors.red},
    vimMapRhs = {fg = colors.base07},
    vimNotation = {fg = colors.base07},
    vimOption = {fg = colors.cyan},
    vimUserFunc = {fg = colors.green},
    vimVar = {fg = colors.yellow},

    -- XML
    xmlCdataStart = {fg = colors.base03, attr = 'bold'},
    xmlAttrib = {fg = colors.base07},
    xmlAttribPunct = {fg = colors.base01},
    xmlCdata = {fg = colors.base03, attr = 'italic'},
    xmlCdataCdata = {fg = colors.base03, attr = 'bold'},
    xmlCdataEnd = {fg = colors.base03, attr = 'bold'},
    xmlNamespace = {fg = colors.base07},
    xmlProcessingDelim = {fg = colors.yellow},

    -- YAML
    yamlBlockMappingKey = {fg = colors.base07},
    yamlBool = {fg = colors.yellow},
    yamlDocumentStart = {fg = colors.yellow},

    -- ZSH
    zshFunction = {fg = colors.green},
    zshDeref = {fg = colors.cyan},
    zshVariableDef = {fg = colors.orange},

    -- ___PLUGIN SUPPORT___

    -- ALE
    -- ( http//github.com/w0rp/ale )
    ALEErrorSign = {fg = colors.red},
    ALEWarningSign = {fg = colors.yellow},

    -- COC.NVIM
    -- ( http//github.com/neoclide/coc.nvim )
    CocErrorSign = {fg = colors.red},
    CocWarningSign = {fg = colors.yellow},
    CocInfoSign = {fg = colors.blue},
    CocHintSign = {fg = colors.blue},
    CocCodeLens = {fg = colors.base05},

    -- FUGITIVE
    -- ( http//github.com/tpope/vim-fugitive )
    gitcommitDiscardedFile = {fg = colors.red},
    gitcommitUntrackedFile = {fg = colors.red},
    gitcommitSelectedFile = {fg = colors.green},

    -- GITGUTTER
    -- ( http//github.com/airblade/vim-gitgutter )
    GitGutterAdd = {fg = colors.green},
    GitGutterChange = {fg = colors.yellow},
    GitGutterChangeDelete = {fg = colors.pink},
    GitGutterDelete = {fg = colors.red},

    -- NERDTREE
    -- ( http//github.com/scrooloose/nerdtree )
    NERDTreeExecFile = {fg = colors.cyan},
    NERDTreeDirSlash = {fg = colors.cyan},
    NERDTreeHelp = {fg = colors.base03, attr = 'italic'},

    -- SIGNIFY
    -- ( http//github.com/mhinz/vim-signify )
    SignifyLineAdd = {fg = colors.green},
    SignifySignAdd = {fg = colors.green},
    SignifyLineChange = {fg = colors.yellow},
    SignifyLineChangeDelete = {fg = colors.yellow},
    SignifySignChange = {fg = colors.yellow},
    SignifySignChangeDelete = {fg = colors.yellow},
    SignifyLineDelete = {fg = colors.red},
    SignifyLineDeleteFirstLine = {fg = colors.red},
    SignifySignDelete = {fg = colors.red},
    SignifyDeleteFirstLine = {fg = colors.red},

    -- TAGBAR
    -- ( http//github.com/majutsushi/tagbar )
    TagbarComment = {fg = colors.base03, attr = 'italic'},
    TagbarKind = {fg = colors.green},

    -- TREESITTER
    -- ( https://github.com/nvim-treesitter/nvim-treesitter )
    TSFunction = {fg = colors.blue, attr = 'bold'},
    TSMethod = {fg = colors.green},
    TSKeywordFunction = {fg = colors.green},
    TSProperty = {fg = colors.green},
    TSType = {fg = colors.pink},
    TSPunctBracket = {fg = colors.magenta},
    TSParameter = {fg = colors.magenta},
    TSParameterReference = {fg = colors.magenta},
    -- Nvim-ts-rainbow ( https://github.com/p00f/nvim-ts-rainbow )
    rainbowcol1 = {fg = colors.magenta},
    rainbowcol2 = {fg = colors.blue},
    rainbowcol3 = {fg = colors.green},
    rainbowcol4 = {fg = colors.yellow},
    rainbowcol5 = {fg = colors.orange},
    rainbowcol6 = {fg = colors.pink},
    rainbowcol7 = {fg = colors.red},
    -- Nvim-treesitter-refactor ( https://github.com/nvim-treesitter/nvim-treesitter-refactor )
    TSDefiniton = {fg = colors.base00, bg = colors.base06, attr = 'bold'},
    TSDefinitonUsage = {fg = colors.red},
    TSCurrentScope = {bg = colors.shadow},
    -- Treesitter-playground ( https://github.com/nvim-treesitter/playground )
    TSPlaygroundFocus = {bg = colors.orange},

    -- VIM-PLUG
    -- ( http//github.com/junegunn/vim-plug )
    plugDeleted = {fg = colors.pink},

    -- VIM-SNEAK
    -- ( http//github.com/justinmk/vim-sneak )
    Sneak = {fg = colors.base00, colors.green},
  }

  return syntax
end

function M.setup(opts)
  local user_colors = opts or {}
  colors = vim.tbl_deep_extend('force', colors, user_colors.colors or {})

  vim.cmd [[hi clear ]]

  if vim.fn.exists('syntax on') then vim.cmd [[ syntax reset ]] end

  vim.o.background = 'dark'
  vim.o.termguicolors = true

  for color, value in pairs(term_colors) do vim.g[color] = value end

  local syntax = M.set_syntax()
  for group, color in pairs(syntax) do highlight(group, color) end

end

return M
