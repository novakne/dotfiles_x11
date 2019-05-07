" Aize
" ~/.config/nvim/colors/aize.vim

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "aize"
set background=dark

" ___COLORS VARIABLES___
" Gui
let s:aize00 = "#29223a"
let s:aize01 = "#3e3350"
let s:aize02 = "#534666"
let s:aize03 = "#6b5c7c"
let s:aize04 = "#837593"
let s:aize05 = "#9d8fa9"
let s:aize06 = "#b7acbf"
let s:aize07 = "#d2ccd6"
let s:aize08 = "#f63d81"
let s:aize09 = "#fc65b0"
let s:aize10 = "#f5939c"
let s:aize11 = "#e8ec77"
let s:aize12 = "#2dcbb0"
let s:aize13 = "#57bbf4"
let s:aize14 = "#a89bee"
let s:aize15 = "#4db9c8"
" Term
let s:black = "0"
let s:red = "1"
let s:green = "2"
let s:yellow = "3"
let s:blue = "4"
let s:magenta = "5"
let s:cyan = "6"
let s:white = "7"
let s:lightBlack = "8"
let s:lightRed = "9"
let s:lightGreen = "10"
let s:lightYellow = "11"
let s:lightBlue = "12"
let s:lightMagenta = "13"
let s:lightCyan = "14"
let s:lightWhite = "15"

" Functions from Nord by Arctic Ice Studio ( https://github.com/arcticicestudio/nord-vim )
if !exists("g:aize_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:aize_italic=1
  else
    let g:aize_italic=0
  endif
endif

let s:italic = "italic,"
if g:aize_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "aize_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:aize_italic_comments")
  if g:aize_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

" Foreground groups to quickly link
call s:hi('aizeDark0', s:aize00, "", "", s:black, "", "")
call s:hi('aizeDark1', s:aize01, "", "", s:black, "", "")
call s:hi('aizeDark2', s:aize02, "", "", s:lightBlack, "", "")
call s:hi('aizeDark3', s:aize03, "", "", s:lightBlack, "", "")
call s:hi('aizeLight3', s:aize04, "", "", s:white, "", "")
call s:hi('aizeLight2', s:aize05, "", "", s:white, "", "")
call s:hi('aizeLight1', s:aize06, "", "", s:lightWhite, "", "")
call s:hi('aizeLight0', s:aize07, "", "", s:lightWhite, "", "")
call s:hi('aizeRed', s:aize08, "", "", s:red, "", "")
call s:hi('aizePink', s:aize09, "", "", s:red, "", "")
call s:hi('aizeOrange', s:aize10, "", "", s:red, "", "")
call s:hi('aizeYellow', s:aize11, "", "", s:yellow, "", "")
call s:hi('aizeGreen', s:aize12, "", "", s:green, "", "")
call s:hi('aizeBlue', s:aize13, "", "", s:blue, "", "")
call s:hi('aizeMagenta', s:aize14, "", "", s:magenta, "", "")
call s:hi('aizeCyan', s:aize15, "", "", s:cyan, "", "")


" ___UI COMPONENTS___
" ( :so $VIMRUNTIME/syntax/hitest.vim )

"ATTRIBUTES
call s:hi("Bold", "", "", "", "", "bold", "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

" EDITOR
call s:hi("ColorColumn", "", s:aize01, "NONE", s:black, "", "")
call s:hi("Cursor", s:aize00, s:aize06, "", "NONE", "", "")
call s:hi("CursorLine", "", s:aize01, "NONE", s:black, "NONE", "")
call s:hi("Error", s:aize08, s:aize00, "", s:red, "", "")
call s:hi("iCursor", s:aize00, s:aize05, "", "NONE", "", "")
call s:hi("LineNr", s:aize02, s:aize00, s:lightBlack, "NONE", "", "")
call s:hi("MatchParen", s:aize12, s:aize02, s:green, s:lightBlack, "", "")
call s:hi("NonText", s:aize02, "", s:lightBlack, "", "", "")
call s:hi("Normal", s:aize07, s:aize00, "NONE", "NONE", "", "")
call s:hi("PMenu", s:aize05, s:aize01, "NONE", s:black, "NONE", "")
call s:hi("PmenuSbar", s:aize05, s:aize02, "NONE", s:black, "", "")
call s:hi("PMenuSel", s:aize01, s:aize12, s:lightCyan, s:lightBlack, "", "")
call s:hi("PmenuThumb", s:aize12, s:aize02, "NONE", s:lightBlack, "", "")
call s:hi("SpecialKey", s:aize04, "", s:lightBlack, "", "", "")
call s:hi("SpellBad", s:aize08, s:aize00, s:red, "NONE", "undercurl", s:aize08)
call s:hi("SpellCap", s:aize09, s:aize00, s:yellow, "NONE", "undercurl", s:aize09)
call s:hi("SpellLocal", s:aize10, s:aize00, s:yellow, "NONE", "undercurl", s:aize10)
call s:hi("SpellRare", s:aize11, s:aize00, s:yellow, "NONE", "undercurl", s:aize11)
call s:hi("Visual", "", s:aize01, "", s:black, "", "")
call s:hi("VisualNOS", "", s:aize03, "", s:black, "", "")
" NEOVIM SUPPORT
call s:hi("healthError", s:aize08, s:aize00, s:red, s:black, "", "")
call s:hi("healthSuccess", s:aize12, s:aize00, s:green, s:black, "", "")
call s:hi("healthWarning", s:aize11, s:aize00, s:yellow, s:black, "", "")
call s:hi("TermCursorNC", "", s:aize01, "", s:black, "", "")

" VIM 8 TERMINAL
if has('terminal')
  let g:terminal_ansi_colors = [s:aize01, s:aize08, s:aize11, s:aize10, s:aize13, s:aize14, s:aize12, s:aize06, s:aize02, s:aize08, s:aize11, s:aize10, s:aize13, s:aize14, s:aize15, s:aize07]
endif

" NEOVIM TERMINAL
if has('nvim')
  let g:terminal_color_0 = s:aize01
  let g:terminal_color_1 = s:aize08
  let g:terminal_color_2 = s:aize12
  let g:terminal_color_3 = s:aize11
  let g:terminal_color_4 = s:aize13
  let g:terminal_color_5 = s:aize14
  let g:terminal_color_6 = s:aize15
  let g:terminal_color_7 = s:aize06
  let g:terminal_color_8 = s:aize02
  let g:terminal_color_9 = s:aize08
  let g:terminal_color_10 = s:aize12
  let g:terminal_color_11 = s:aize11
  let g:terminal_color_12 = s:aize13
  let g:terminal_color_13 = s:aize14
  let g:terminal_color_14 = s:aize15
  let g:terminal_color_15 = s:aize07
endif

" GUTTER
call s:hi("CursorColumn", "", s:aize01, "NONE", s:black, "", "")
call s:hi("CursorLineNr", s:aize05, s:aize00, "NONE", "", "", "")
call s:hi("Folded", s:aize04, s:aize01, s:lightBlack, s:black, "bold", "")
call s:hi("FoldColumn", s:aize03, s:aize00, s:lightBlack, "NONE", "", "")
call s:hi("SignColumn", s:aize01, s:aize00, s:black, "NONE", "", "")

" NAVIGATION
call s:hi("Directory", s:aize12, "", s:cyan, "NONE", "", "")

" PROMPT / STATUS
call s:hi("EndOfBuffer", s:aize01, "", s:black, "NONE", "", "")
call s:hi("ErrorMsg", s:aize00, s:aize08, "NONE", s:red, "", "")
call s:hi("ModeMsg", s:aize04, "", "", "", "", "")
call s:hi("MoreMsg", s:aize04, "", "", "", "", "")
call s:hi("Question", s:aize04, "", "NONE", "", "", "")
call s:hi("StatusLine", s:aize05, s:aize01, s:lightWhite, s:lightBlack, "NONE", "")
call s:hi("StatusLineNC", s:aize03, s:aize01, "NONE", s:black, "NONE", "")
call s:hi("StatusLineTerm", s:aize05, s:aize01, s:lightWhite, s:lightBlack, "NONE", "")
call s:hi("StatusLineTermNC", s:aize03, s:aize01, "NONE", s:black, "NONE", "")
call s:hi("WarningMsg", s:aize00, s:aize11, s:black, s:yellow, "", "")
call s:hi("WildMenu", s:aize11, s:aize01, s:yellow, s:black, "", "")

" SEARCH 
call s:hi("IncSearch", s:aize01, s:aize12, s:black, s:cyan, s:underline, "")
call s:hi("Search", s:aize01, s:aize13, s:black, s:blue, "NONE", "")

" TABS
call s:hi("TabLine", s:aize04, s:aize01, "NONE", s:black, "NONE", "")
call s:hi("TabLineFill", s:aize04, s:aize01, "NONE", s:black, "NONE", "")
call s:hi("TabLineSel", s:aize00, s:aize13, s:lightWhite, s:lightBlack, "NONE", "")

" WINDOW
call s:hi("Title", s:aize04, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:aize01, s:aize00, s:lightBlack, s:black, "NONE", "")

" DIFF
call s:hi("DiffAdd", s:aize12, s:aize00, s:green, "NONE", "inverse", "")
call s:hi("DiffChange", s:aize11, s:aize00, s:yellow, "NONE", "inverse", "")
call s:hi("DiffDelete", s:aize08, s:aize00, s:red, "NONE", "inverse", "")
call s:hi("DiffText", s:aize13, s:aize00, s:blue, "NONE", "inverse", "")
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

" QUICKFIX / LOCATION LIST
call s:hi("qfLineNr", s:aize06, "", "NONE", "", "", "")


" ___LANGUAGE BASE GROUPS___
" ( :help w18 )

call s:hi("Comment", s:aize03, "", s:lightBlack, "", s:italicize_comments, "")

call s:hi("Constant", s:aize09, "", "NONE", "", "", "")
call s:hi("String", s:aize14, "", s:magenta, "", s:italic, "")
call s:hi("Character", s:aize09, "", s:red, "", "", "")
call s:hi("Number", s:aize08, "", s:magenta, "", "", "")
call s:hi("Boolean", s:aize12, "", s:green, "", "", "")
call s:hi("Float", s:aize10, "", s:magenta, "", "", "")

call s:hi("Identifier", s:aize13, "", s:blue, "", "NONE", "")
call s:hi("Function", s:aize12, "", s:cyan, "", "", "")

call s:hi("Statement", s:aize14, "", s:magenta, "", "NONE", "")
call s:hi("Conditional", s:aize13, "", s:blue, "", "", "")
call s:hi("Repeat", s:aize14, "", s:magenta, "", "", "")
call s:hi("Label", s:aize08, "", s:red, "", "", "")
call s:hi("Operator", s:aize13, "", s:blue, "", "NONE", "")
call s:hi("Keyword", s:aize11, "", s:yellow, "", "", "")
call s:hi("Exception", s:aize08, "", s:red, "", "", "")

call s:hi("PreProc", s:aize14, "", s:magenta, "", "NONE", "")
call s:hi("Include", s:aize15, "", s:cyan, "", "", "")
call s:hi("Define", s:aize13, "", s:blue, "", "", "")
call s:hi("Macro", s:aize11, "", s:yellow, "", "", "")
call s:hi("PreCondit", s:aize11, "", s:yellow, "", "NONE", "")

call s:hi("Type", s:aize09, "", s:red, "", "NONE", "")
call s:hi("StorageClass", s:aize09, "", s:red, "", "", "")
call s:hi("Structure", s:aize09, "", s:red, "", "", "")
call s:hi("Typedef", s:aize13, "", s:blue, "", "", "")

call s:hi("Special", s:aize05, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:aize13, "", s:blue, "", "", "")
call s:hi("Tag", s:aize05, "", "", "", "", "")
call s:hi("Delimiter", s:aize06, "", s:lightWhite, "", "", "")
call s:hi("SpecialComment", s:aize05, "", s:white, "", s:italicize_comments, "")
call s:hi("Todo", s:aize13, "NONE", s:blue, "NONE", "", "")

" ___LANGUAGES SPECIFIC___

" CFG
hi! link CfgValues aizeBlue
hi! link CfgSection aizeGreen

" CSS
hi! link cssAttr Keyword
hi! link cssAttributeSelector aizeBlue
hi! link cssBraces Delimiter
hi! link cssClassName aizeCyan
hi! link cssClassNameDot aizeRed
hi! link cssColor aizeLight1
hi! link cssDefinition aizeLight0
hi! link cssFontAttr aizeMagenta
hi! link cssImportant aizeRed
hi! link cssMediaType aizeGreen
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId aizeBlue
hi! link cssSelectorOp Keyword
hi! link cssTagName aizeBlue
hi! link cssUnitDecorators aizeOrange
hi! link cssVendor Keyword

" GO
hi! link goBuiltins aizeCyan
hi! link goConstants Keyword

" HTML
call s:hi("htmlLink", s:aize04, "", "", "", "NONE", "NONE")
hi! link htmlArg aizeLight0
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlItalic Italic
hi! link htmlSpecialChar SpecialChar
hi! link htmlSpecialTagName aizePink
hi! link htmlTag aizeBlue
hi! link htmlTagN htmlTag
hi! link htmlTagName htmlTag
hi! link htmlTitle aizeOrange

" JAVA
hi! link javaCommentTitle Comment
hi! link javaDocTags aizeLight0

" JAVASCRIPT
" ( https://github.com/pangloss/vim-javascript )
call s:hi("jsGlobalNodeObjects", s:aize08, "", s:red, "", s:italic, "")
call s:hi("jsVariableDef", s:aize06, "", s:lightWhite, "", s:italic, "")
call s:hi("jsFuncArgs", s:aize06, "", s:lightWhite, "", s:italic, "")
hi! link jsArrowFunction aizeYellow
hi! link jsBrackets Delimiter
hi! link jsClassDefinition aizeGreen
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsGlobalObjects aizeRed
hi! link jsNoise Delimiter
hi! link jsObjectProp aizeCyan
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar
hi! link jsReturn aizeYellow
hi! link jsTemplateString aizeYellow
hi! link jsThis Keyword

" JSX
"  ( https://github.com/mxw/vim-jsx )
hi! link xmlTag aizeBlue
hi! link xmlTagName xmlTag
hi! link xmlEndTag xmlTag

" JSON
hi! link jsonBraces aizeBlue
hi! link jsonKeyword aizeLight0
hi! link jsonKeywordMatch aizeYellow
hi! link jsonNoise aizePink

" LESS
"  ( https://github.com/groenewege/vim-less )
hi! link lessAmpersand Keyword
hi! link lessClass aizeLight0
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link lessVariable aizePink

" MARKDOWN
call s:hi("markdownUrl", s:aize04, "", "NONE", "", "NONE", "")
hi! link markdownBlockquote aizeLight0
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownCode aizeLight0
hi! link markdownCodeDelimiter aizeLight0
hi! link markdownFootnote aizeLight0
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH1 aizePink
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownHeadingDelimiter Keyword
hi! link markdownId aizeLight0
hi! link markdownIdDeclaration aizeLight0
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkText aizeRed
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword

" ( https://github.com/plasticboy/vim-markdown )
hi! link mkdListItem aizeYellow
hi! link mkdCode aizeGreen
hi! link mkdHeading markdownH1
hi! link mkdURL aizeBlue

" PHP
hi! link phpClasses aizeLight0
hi! link phpDocCustomTags phpDocTags
hi! link phpDocTags aizeLight0
hi! link phpMemberSelector Keyword

" PYTHON
hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

" RUST
" ( https://github.com/rust-lang/rust.vim )
hi! link rustArrowCharacter aizeGreen

" SCSS
" ( https://github.com/cakebaker/scss-syntax.vim )
hi! link scssVariable aizePink

" SHELL
hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

" VIM
hi! link vimAugroup aizeLight0
hi! link vimCommand aizeBlue
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimMap aizeRed
hi! link vimMapRhs aizeLight0
hi! link vimNotation aizeLight0
hi! link vimOption aizeCyan
hi! link vimUserFunc Function
hi! link vimVar aizeYellow

" XML
call s:hi("xmlCdataStart", s:aize03, "", s:lightBlack, "", "bold", "")
hi! link xmlAttrib aizeLight0
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlNamespace aizeLight0
hi! link xmlProcessingDelim Keyword

" YAML
hi! link yamlBlockMappingKey aizeLight0
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

" ZSH
hi! link zshFunction Function
hi! link zshDeref aizeCyan
hi! link zshVariableDef aizeOrange


" ___PLUGIN SUPPORT___

" ALE
" ( https://github.com/w0rp/ale )
hi! link ALEErrorSign aizeRed
hi! link ALEWarningSign aizeYellow

" COC.NVIM
" ( https://github.com/neoclide/coc.nvim )
hi! link CocErrorSign aizeRed
hi! link CocWarningSign aizeYellow
hi! link CocInfoSign aizeBlue
hi! link CocHintSign aizeBlue
hi! link CocCodeLens aizeLight2

" FUGITIVE
" ( https://github.com/tpope/vim-fugitive )
hi! link gitcommitDiscardedFile aizeRed
hi! link gitcommitUntrackedFile aizeRed
hi! link gitcommitSelectedFile aizeGreen

" GITGUTTER
" ( https://github.com/airblade/vim-gitgutter )
hi! link GitGutterAdd aizeGreen
hi! link GitGutterChange aizeYellow
hi! link GitGutterChangeDelete aizePink
hi! link GitGutterDelete aizeRed

" NERDTREE
" ( https://github.com/scrooloose/nerdtree )
hi! link NERDTreeExecFile aizeCyan
hi! link NERDTreeDirSlash Include
hi! link NERDTreeHelp Comment

" SIGNIFY
" ( https://github.com/mhinz/vim-signify )
hi! link SignifyLineAdd aizeGreen
hi! link SignifySignAdd SignifyLineAdd
hi! link SignifyLineChange aizeYellow
hi! link SignifyLineChangeDelete SignifyLineChange
hi! link SignifySignChange SignifyLineChange
hi! link SignifySignChangeDelete SignifyLineChange
hi! link SignifyLineDelete aizeRed
hi! link SignifyLineDeleteFirstLine SignifyLineDelete
hi! link SignifySignDelete SignifyLineDelete
hi! link SignifyDeleteFirstLine SignifyLineDelete

" TAGBAR
" ( https://github.com/majutsushi/tagbar )
hi! link TagbarComment Comment
hi! link TagbarKind Function

" VIM-PLUG
" ( https://github.com/junegunn/vim-plug )
hi! link plugDeleted aizePink

" VIM-SNEAK
" ( https://github.com/justinmk/vim-sneak )
call s:hi("Sneak", s:aize00, s:aize12, s:black, s:cyan, "", "")
