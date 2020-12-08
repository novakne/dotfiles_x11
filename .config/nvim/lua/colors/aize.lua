-- Aize Color Scheme
local vim = vim

vim.o.background = "dark"

-- Gui
local aize00 = "#29223a"
local aize01 = "#3e3350"
local aize02 = "#534666"
local aize03 = "#6b5c7c"
local aize04 = "#837593"
local aize05 = "#9d8fa9"
local aize06 = "#b7acbf"
local aize07 = "#d2ccd6"
local aize08 = "#f63d81"
local aize09 = "#fc65b0"
local aize10 = "#f5939c"
local aize11 = "#e8ec77"
local aize12 = "#2dcbb0"
local aize13 = "#57bbf4"
local aize14 = "#a89bee"
local aize15 = "#4db9c8"
-- Term
local black        = "0"
local red          = "1"
local green        = "2"
local yellow       = "3"
local blue         = "4"
local magenta      = "5"
local cyan         = "6"
local white        = "7"
local lightBlack   = "8"
local lightRed     = "9"
local lightGreen   = "10"
local lightYellow  = "11"
local lightBlue    = "12"
local lightMagenta = "13"
local lightCyan    = "14"
local lightWhite   = "15"

local term_colors = {
  terminal_color_0 = aize01,
  terminal_color_1 = aize08,
  terminal_color_2 = aize12,
  terminal_color_3 = aize11,
  terminal_color_4 = aize13,
  terminal_color_5 = aize14,
  terminal_color_6 = aize15,
  terminal_color_7 = aize06,
  terminal_color_8 = aize02,
  terminal_color_9 = aize08,
  terminal_color_10 = aize12,
  terminal_color_11 = aize11,
  terminal_color_12 = aize13,
  terminal_color_13 = aize14,
  terminal_color_14 = aize15,
  terminal_color_15 = aize07
}

for color, value in pairs(term_colors) do
  vim.g[color] = value
end

-- Source: https://github.com/norcalli/nvim_utils
local function highlight(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  local parts = {group}
  if guifg then table.insert(parts, "guifg="..guifg) end
  if guibg then table.insert(parts, "guibg="..guibg) end
  if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
  if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
  if attr then
    table.insert(parts, "gui="..attr)
    table.insert(parts, "cterm="..attr)
  end
  if guisp then table.insert(parts, "guisp="..guisp) end
  vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end

-- ___UI COMPONENTS___
-- ( :so $VIMRUNTIME/syntax/hitest.vim )

-- ATTRIBUTES
highlight("Bold", nil, nil, nil, nil, "bold", nil)
highlight("Italic", nil, nil, nil, nil, "italic", nil)
highlight("Underline", nil, nil, nil, nil, "underline", nil)

-- EDITOR
highlight("ColorColumn", nil, aize01, "NONE", black, nil, nil)
highlight("Cursor", aize00, aize06, nil, "NONE", nil, nil)
highlight("CursorLine", nil, aize01, "NONE", black, "NONE", nil)
highlight("Error", aize08, aize00, nil, red, nil, nil)
highlight("iCursor", aize00, aize05, nil, "NONE", nil, nil)
highlight("LineNr", aize02, aize00, lightBlack, "NONE", nil, nil)
highlight("MatchParen", aize12, aize02, green, lightBlack, nil, nil)
highlight("NonText", aize02, nil, lightBlack, nil, nil, nil)
highlight("Normal", aize07, aize00, "NONE", "NONE", nil, nil)
highlight("PMenu", aize05, aize01, "NONE", black, "NONE", nil)
highlight("PmenuSbar", aize05, aize02, "NONE", black, nil, nil)
highlight("PMenuSel", aize01, aize12, lightCyan, lightBlack, nil, nil)
highlight("PmenuThumb", aize12, aize02, "NONE", lightBlack, nil, nil)
highlight("SpecialKey", aize04, nil, lightBlack, nil, nil, nil)
highlight("SpellBad", aize08, aize00, red, "NONE", "undercurl", aize08)
highlight("SpellCap", aize09, aize00, yellow, "NONE", "undercurl", aize09)
highlight("SpellLocal", aize10, aize00, yellow, "NONE", "undercurl", aize10)
highlight("SpellRare", aize11, aize00, yellow, "NONE", "undercurl", aize11)
highlight("Visual", nil, aize01, nil, black, nil, nil)
highlight("VisualNOS", nil, aize03, nil, black, nil, nil)

-- NEOVIM SUPPORT
highlight("healthError", aize08, aize00, red, black, nil, nil)
highlight("healthSuccess", aize12, aize00, green, black, nil, nil)
highlight("healthWarning", aize11, aize00, yellow, black, nil, nil)
highlight("TermCursorNC", nil, aize01, nil, black, nil, nil)

-- GUTTER
highlight("CursorColumn", nil, aize01, "NONE", black, nil, nil)
highlight("CursorLineNr", aize05, aize00, "NONE", nil, nil, nil)
highlight("Folded", aize04, aize01, lightBlack, black, "bold", nil)
highlight("FoldColumn", aize03, aize00, lightBlack, "NONE", nil, nil)
highlight("SignColumn", aize01, aize00, black, "NONE", nil, nil)

-- NAVIGATION
highlight("Directory", aize12, nil, cyan, "NONE", nil, nil)

-- PROMPT / STATUS
highlight("EndOfBuffer", aize01, nil, black, "NONE", nil, nil)
highlight("ErrorMsg", aize00, aize08, "NONE", red, nil, nil)
highlight("ModeMsg", aize04, nil, nil, nil, nil, nil)
highlight("MoreMsg", aize04, nil, nil, nil, nil, nil)
highlight("Question", aize04, nil, "NONE", nil, nil, nil)
highlight("StatusLine", aize05, aize01, lightWhite, lightBlack, "NONE", nil)
highlight("StatusLineNC", aize03, aize01, "NONE", black, "NONE", nil)
highlight("StatusLineTerm", aize05, aize01, lightWhite, lightBlack, "NONE", nil)
highlight("StatusLineTermNC", aize03, aize01, "NONE", black, "NONE", nil)
highlight("WarningMsg", aize00, aize11, black, yellow, nil, nil)
highlight("WildMenu", aize11, aize01, yellow, black, nil, nil)

-- SEARCH
highlight("IncSearch", aize01, aize11, black, yellow, "underline", nil)
highlight("Search", aize01, aize13, black, blue, "NONE", nil)

-- TABS
highlight("TabLine", aize04, aize01, "NONE", black, "NONE", nil)
highlight("TabLineFill", aize04, aize01, "NONE", black, "NONE", nil)
highlight("TabLineSel", aize00, aize13, lightWhite, lightBlack, "NONE", nil)

-- WINDOW
highlight("Title", aize04, nil, "NONE", nil, "NONE", nil)
highlight("VertSplit", aize01, aize00, lightBlack, black, "NONE", nil)

-- DIFF
highlight("DiffAdd", aize12, aize00, green, "NONE", "inverse", nil)
highlight("DiffChange", aize11, aize00, yellow, "NONE", "inverse", nil)
highlight("DiffDelete", aize08, aize00, red, "NONE", "inverse", nil)
highlight("DiffText", aize13, aize00, blue, "NONE", "inverse", nil)
-- Legacy groups for official git.vim and diff.vim syntax
highlight("diffAdded", aize12, aize00, green, "NONE", "inverse", nil)
highlight("diffChanged", aize11, aize00, yellow, "NONE", "inverse", nil)
highlight("diffRemoved", aize08, aize00, red, "NONE", "inverse", nil)

-- QUICKFIX / LOCATION LIST
highlight("qfLineNr", aize06, nil, "NONE", nil, nil, nil)

-- NEOVIM LSP
highlight("LspDiagnosticsDefaultError" , aize08, nil, nil, red, nil, nil)
highlight("LspDiagnosticsDefaultWarning" , aize11, nil, nil, yellow, nil, nil)
highlight("LspDiagnosticsDefaultInformation" , aize13, nil, nil, blue, nil, nil)
highlight("LspDiagnosticsDefaultHint" , aize12, nil, nil, green, nil, nil)

-- ___LANGUAGE BASE GROUPS___
-- ( :help w18 )

highlight("Comment", aize03, nil, lightBlack, nil, "italic", nil)

highlight("Constant", aize09, nil, "NONE", nil, nil, nil)
highlight("String", aize14, nil, magenta, nil, "italic", nil)
highlight("Character", aize09, nil, red, nil, nil, nil)
highlight("Number", aize08, nil, magenta, nil, nil, nil)
highlight("Boolean", aize12, nil, green, nil, nil, nil)
highlight("Float", aize10, nil, magenta, nil, nil, nil)

highlight("Identifier", aize13, nil, blue, nil, "NONE", nil)
highlight("Function", aize12, nil, cyan, nil, nil, nil)

highlight("Statement", aize14, nil, magenta, nil, "NONE", nil)
highlight("Conditional", aize13, nil, blue, nil, nil, nil)
highlight("Repeat", aize14, nil, magenta, nil, nil, nil)
highlight("Label", aize08, nil, red, nil, nil, nil)
highlight("Operator", aize13, nil, blue, nil, "NONE", nil)
highlight("Keyword", aize11, nil, yellow, nil, nil, nil)
highlight("Exception", aize08, nil, red, nil, nil, nil)

highlight("PreProc", aize14, nil, magenta, nil, "NONE", nil)
highlight("Include", aize15, nil, cyan, nil, nil, nil)
highlight("Define", aize13, nil, blue, nil, nil, nil)
highlight("Macro", aize11, nil, yellow, nil, nil, nil)
highlight("PreCondit", aize11, nil, yellow, nil, "NONE", nil)

highlight("Type", aize09, nil, red, nil, "NONE", nil)
highlight("StorageClass", aize09, nil, red, nil, nil, nil)
highlight("Structure", aize09, nil, red, nil, nil, nil)
highlight("Typedef", aize13, nil, blue, nil, nil, nil)

highlight("Special", aize05, nil, "NONE", nil, nil, nil)
highlight("SpecialChar", aize13, nil, blue, nil, nil, nil)
highlight("Tag", aize05, nil, nil, nil, nil, nil)
highlight("Delimiter", aize06, nil, lightWhite, nil, nil, nil)
highlight("SpecialComment", aize05, nil, white, nil, "italic", nil)
highlight("Todo", aize13, "NONE", blue, "NONE", nil, nil)

-- ___LANGUAGES SPECIFIC___

-- CFG
highlight("CfgValues", aize13, nil, nil, blue, nil, nil)
highlight("CfgSection", aize12, nil, nil, green, nil, nil)

-- CSS
highlight("cssAttr", aize11, nil, yellow, nil, nil, nil)
highlight("cssAttributeSelector", aize13, nil, nil, blue, nil, nil)
highlight("cssBraces", aize06, nil, lightWhite, nil, nil, nil)
highlight("cssClassName", aize15, nil, nil, cyan, nil, nil)
highlight("cssClassNameDot", aize08, nil, nil, red, nil, nil)
highlight("cssColor", aize06, nil, nil, lightWhite, nil, nil)
highlight("cssDefinition", aize07, nil, nil, lightWhite, nil, nil)
highlight("cssFontAttr", aize14, nil, nil, magenta, nil, nil)
highlight("cssImportant", aize08, nil, nil, red, nil, nil)
highlight("cssMediaType", aize12, nil, nil, green, nil, nil)
highlight("cssProp", aize07, nil, nil, lightWhite, nil, nil)
highlight("cssPseudoClass", aize07, nil, nil, lightWhite, nil, nil)
highlight("cssPseudoClassId", aize13, nil, nil, blue, nil, nil)
highlight("cssSelectorOp", aize11, nil, yellow, nil, nil, nil)
highlight("cssTagName", aize13, nil, nil, blue, nil, nil)
highlight("cssUnitDecorators", aize10, nil, nil, red, nil, nil)
highlight("cssVendor", aize11, nil, yellow, nil, nil, nil)

-- GO
highlight("goBuiltins", aize15, nil, nil, cyan, nil, nil)
highlight("goConstants", aize11, nil, yellow, nil, nil, nil)

-- HTML
highlight("htmlLink", aize13, nil, nil, nil, "NONE", "NONE")
highlight("htmlArg", aize07, nil, nil, lightWhite, nil, nil)
highlight("htmlBold", nil, nil, nil, nil, "bold", nil)
highlight("htmlEndTag", aize13, nil, nil, blue, nil, nil)
highlight("htmlH1", aize09, nil, nil, red, nil, nil)
highlight("htmlH2", aize09, nil, nil, red, nil, nil)
highlight("htmlH3", aize09, nil, nil, red, nil, nil)
highlight("htmlH4", aize09, nil, nil, red, nil, nil)
highlight("htmlH5", aize09, nil, nil, red, nil, nil)
highlight("htmlH6", aize09, nil, nil, red, nil, nil)
highlight("htmlItalic", nil, nil, nil, nil, "italic", nil)
highlight("htmlSpecialChar", aize13, nil, blue, nil, nil, nil)
highlight("htmlSpecialTagName", aize09, nil, nil, red, nil, nil)
highlight("htmlTag", aize13, nil, nil, blue, nil, nil)
highlight("htmlTagN", aize13, nil, nil, blue, nil, nil)
highlight("htmlTagName", aize13, nil, nil, blue, nil, nil)
highlight("htmlTitle", aize10, nil, nil, red, nil, nil)

-- JAVA
highlight("javaCommentTitle", aize03, nil, lightBlack, nil, "italic", nil)
highlight("javaDocTags", aize07, nil, nil, lightWhite, nil, nil)

-- JAVASCRIPT
-- ( http//github.com/pangloss/vim-javascript )
highlight("jsGlobalNodeObjects", aize08, nil, red, nil, "italic", nil)
highlight("jsVariableDef", aize06, nil, lightWhite, nil, "italic", nil)
highlight("jsFuncArgs", aize06, nil, lightWhite, nil, "italic", nil)
highlight("jsArrowFunction", aize11, nil, nil, yellow, nil, nil)
highlight("jsBrackets", aize06, nil, lightWhite, nil, nil, nil)
highlight("jsClassDefinition", aize12, nil, nil, green, nil, nil)
highlight("jsFuncCall", aize12, nil, cyan, nil, nil, nil)
highlight("jsFuncParens", aize06, nil, lightWhite, nil, nil, nil)
highlight("jsGlobalObjects", aize08, nil, nil, red, nil, nil)
highlight("jsNoise", aize06, nil, lightWhite, nil, nil, nil)
highlight("jsObjectProp", aize15, nil, nil, cyan, nil, nil)
highlight("jsPrototype", aize11, nil, yellow, nil, nil, nil)
highlight("jsRegexpString", aize13, nil, blue, nil, nil, nil)
highlight("jsReturn", aize11, nil, nil, yellow, nil, nil)
highlight("jsTemplateString", aize11, nil, nil, yellow, nil, nil)
highlight("jsThis", aize11, nil, yellow, nil, nil, nil)

-- JSX
--  ( http//github.com/mxw/vim-jsx )
highlight("xmlTag", aize13, nil, nil, blue, nil, nil)
highlight("xmlTagName", aize13, nil, nil, blue, nil, nil)
highlight("xmlEndTag", aize13, nil, nil, blue, nil, nil)

-- JSON
highlight("jsonBraces" , aize13, nil, nil, blue, nil, nil)
highlight("jsonKeyword", aize07, nil, nil, lightWhite, nil, nil)
highlight("jsonKeywordMatch" , aize11, nil, nil, yellow, nil, nil)
highlight("jsonNoise", aize09, nil, nil, red, nil, nil)

-- LATEX
-- (  http//github.com/lervag/vimtex )
highlight("texStatement", aize12, nil, nil, green, nil, nil)
highlight("texUrl", aize13, nil, nil, blue, nil, nil)

-- LESS
--  ( http//github.com/groenewege/vim-less )
highlight("lessAmpersand", aize11, nil, yellow, nil, nil, nil)
highlight("lessClass", aize07, nil, nil, lightWhite, nil, nil)
highlight("lessCssAttribute", aize06, nil, lightWhite, nil, nil, nil)
highlight("lessFunction", aize12, nil, cyan, nil, nil, nil)
highlight("lessVariable" , aize09, nil, nil, red, nil, nil)

-- LUA
highlight("luaFuncCall", aize11, nil, yellow, nil, nil, nil)
highlight("luaLocal", aize15, nil, cyan, nil, nil, nil)
highlight("luaFuncKeyword", aize14, nil, magenta, nil, nil, nil)
highlight("luaSpecialValue", aize10, nil, red, nil, nil, nil)
highlight("luaStatement", aize12, nil, green, nil, nil, nil)
highlight("luaRepeat", aize09, nil, red, nil, nil, nil)
highlight("luaConstant", aize08, nil, red, nil, nil, nil)

-- MARKDOWN
highlight("markdownUrl", aize04, nil, "NONE", nil, "NONE", nil)
highlight("markdownBlockquote", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownBold", nil, nil, nil, nil, "bold", nil)
highlight("markdownBoldDelimiter", aize11, nil, yellow, nil, nil, nil)
highlight("markdownCode", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownCodeDelimiter", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownFootnote", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownFootnoteDefinition", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownH1", aize09, nil, nil, red, nil, nil)
highlight("markdownH2", aize09, nil, nil, red, nil, nil)
highlight("markdownH3", aize09, nil, nil, red, nil, nil)
highlight("markdownH4", aize09, nil, nil, red, nil, nil)
highlight("markdownH5", aize09, nil, nil, red, nil, nil)
highlight("markdownH6", aize09, nil, nil, red, nil, nil)
highlight("markdownHeadingDelimiter", aize11, nil, yellow, nil, nil, nil)
highlight("markdownId", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownIdDeclaration", aize07, nil, nil, lightWhite, nil, nil)
highlight("markdownIdDelimiter", aize11, nil, yellow, nil, nil, nil)
highlight("markdownItalic", nil, nil, nil, nil, "italic", nil)
highlight("markdownItalicDelimiter", aize11, nil, yellow, nil, nil, nil)
highlight("markdownLinkDelimiter", aize11, nil, yellow, nil, nil, nil)
highlight("markdownLinkText" , aize08, nil, nil, red, nil, nil)
highlight("markdownLinkTextDelimiter", aize11, nil, yellow, nil, nil, nil)
highlight("markdownListMarker", aize11, nil, yellow, nil, nil, nil)
highlight("markdownRule", aize11, nil, yellow, nil, nil, nil)

-- ( http//github.com/plasticboy/vim-markdown )
highlight("mkdListItem" , aize11, nil, nil, yellow, nil, nil)
highlight("mkdCode" , aize12, nil, nil, green, nil, nil)
highlight("mkdHeading", aize09, nil, nil, red, nil, nil)
highlight("mkdURL" , aize13, nil, nil, blue, nil, nil)

-- PHP
highlight("phpClasses", aize07, nil, nil, lightWhite, nil, nil)
highlight("phpDocCustomTags", aize07, nil, nil, lightWhite, nil, nil)
highlight("phpDocTags", aize07, nil, nil, lightWhite, nil, nil)
highlight("phpMemberSelector", aize11, nil, yellow, nil, nil, nil)

-- PYTHON
highlight("pythonBuiltin", aize09, nil, red, nil, "NONE", nil)
highlight("pythonEscape", aize13, nil, blue, nil, nil, nil)

-- RUST
-- ( http//github.com/rust-lang/rust.vim )
highlight("rustArrowCharacter", aize12, nil, nil, green, nil, nil)

-- SCSS
-- ( http//github.com/cakebaker/scss-syntax.vim )
highlight("scssVariable", aize09, nil, nil, red, nil, nil)

-- SHELL
highlight("shCmdParenRegion", aize06, nil, lightWhite, nil, nil, nil)
highlight("shCmdSubRegion", aize06, nil, lightWhite, nil, nil, nil)
highlight("shDerefSimple", aize13, nil, blue, nil, "NONE", nil)
highlight("shDerefVar", aize13, nil, blue, nil, "NONE", nil)

-- VIM
highlight("vimAugroup", aize07, nil, nil, lightWhite, nil, nil)
highlight("vimCommand" , aize13, nil, nil, blue, nil, nil)
highlight("vimFunc", aize12, nil, cyan, nil, nil, nil)
highlight("vimFunction", aize12, nil, cyan, nil, nil, nil)
highlight("vimMap" , aize08, nil, nil, red, nil, nil)
highlight("vimMapRhs", aize07, nil, nil, lightWhite, nil, nil)
highlight("vimNotation", aize07, nil, nil, lightWhite, nil, nil)
highlight("vimOption" , aize15, nil, nil, cyan, nil, nil)
highlight("vimUserFunc", aize12, nil, cyan, nil, nil, nil)
highlight("vimVar" , aize11, nil, nil, yellow, nil, nil)

-- XML
highlight("xmlCdataStart", aize03, nil, lightBlack, nil, "bold", nil)
highlight("xmlAttrib", aize07, nil, nil, lightWhite, nil, nil)
highlight("xmlAttribPunct", aize06, nil, lightWhite, nil, nil, nil)
highlight("xmlCdata", aize03, nil, lightBlack, nil, "italic", nil)
highlight("xmlCdataCdata", aize03, nil, lightBlack, nil, "bold", nil)
highlight("xmlCdataEnd", aize03, nil, lightBlack, nil, "bold", nil)
highlight("xmlNamespace", aize07, nil, nil, lightWhite, nil, nil)
highlight("xmlProcessingDelim", aize11, nil, yellow, nil, nil, nil)

-- YAML
highlight("yamlBlockMappingKey", aize07, nil, nil, lightWhite, nil, nil)
highlight("yamlBool", aize11, nil, yellow, nil, nil, nil)
highlight("yamlDocumentStart", aize11, nil, yellow, nil, nil, nil)

-- ZSH
highlight("zshFunction", aize12, nil, cyan, nil, nil, nil)
highlight("zshDeref", aize15, nil, nil, cyan, nil, nil)
highlight("zshVariableDef", aize10, nil, nil, red, nil, nil)


-- ___PLUGIN SUPPORT___

-- ALE
-- ( http//github.com/w0rp/ale )
highlight("ALEErrorSign", aize08, nil, nil, red, nil, nil)
highlight("ALEWarningSign", aize11, nil, nil, yellow, nil, nil)

-- COC.NVIM
-- ( http//github.com/neoclide/coc.nvim )
highlight("CocErrorSign", aize08, nil, nil, red, nil, nil)
highlight("CocWarningSign", aize11, nil, nil, yellow, nil, nil)
highlight("CocInfoSign", aize13, nil, nil, blue, nil, nil)
highlight("CocHintSign", aize13, nil, nil, blue, nil, nil)
highlight("CocCodeLens", aize05, nil, nil, white, nil, nil)

-- FUGITIVE
-- ( http//github.com/tpope/vim-fugitive )
highlight("gitcommitDiscardedFile", aize08, nil, nil, red, nil, nil)
highlight("gitcommitUntrackedFile", aize08, nil, nil, red, nil, nil)
highlight("gitcommitSelectedFile", aize12, nil, nil, green, nil, nil)

-- GITGUTTER
-- ( http//github.com/airblade/vim-gitgutter )
highlight("GitGutterAdd", aize12, nil, nil, green, nil, nil)
highlight("GitGutterChange", aize11, nil, nil, yellow, nil, nil)
highlight("GitGutterChangeDelete", aize09, nil, nil, red, nil, nil)
highlight("GitGutterDelete", aize08, nil, nil, red, nil, nil)

-- NERDTREE
-- ( http//github.com/scrooloose/nerdtree )
highlight("NERDTreeExecFile", aize15, nil, nil, cyan, nil, nil)
highlight("NERDTreeDirSlash", aize15, nil, cyan, nil, nil, nil)
highlight("NERDTreeHelp", aize03, nil, lightBlack, nil, "italic", nil)

-- SIGNIFY
-- ( http//github.com/mhinz/vim-signify )
highlight("SignifyLineAdd", aize12, nil, nil, green, nil, nil)
highlight("SignifySignAdd", aize12, nil, nil, green, nil, nil)
highlight("SignifyLineChange", aize11, nil, nil, yellow, nil, nil)
highlight("SignifyLineChangeDelete", aize11, nil, nil, yellow, nil, nil)
highlight("SignifySignChange", aize11, nil, nil, yellow, nil, nil)
highlight("SignifySignChangeDelete", aize11, nil, nil, yellow, nil, nil)
highlight("SignifyLineDelete", aize08, nil, nil, red, nil, nil)
highlight("SignifyLineDeleteFirstLine", aize08, nil, nil, red, nil, nil)
highlight("SignifySignDelete", aize08, nil, nil, red, nil, nil)
highlight("SignifyDeleteFirstLine", aize08, nil, nil, red, nil, nil)

-- TAGBAR
-- ( http//github.com/majutsushi/tagbar )
highlight("TagbarComment", aize03, nil, lightBlack, nil, "italic", nil)
highlight("TagbarKind", aize12, nil, cyan, nil, nil, nil)

-- VIM-PLUG
-- ( http//github.com/junegunn/vim-plug )
highlight("plugDeleted", aize09, nil, nil, red, nil, nil)

-- VIM-SNEAK
-- ( http//github.com/justinmk/vim-sneak )
highlight("Sneak", aize00, aize12, black, cyan, nil, nil)

vim.cmd("syntax on")
