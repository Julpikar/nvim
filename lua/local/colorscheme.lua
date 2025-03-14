local Colorscheme = {}

function Colorscheme.setup()
  vim.o.termguicolors = true

  local nvim_set_hl = vim.api.nvim_set_hl

  -- Terminal colors
  vim.g.terminal_color_0 = "#414b50"
  vim.g.terminal_color_1 = "#e67e80"
  vim.g.terminal_color_2 = "#a7c080"
  vim.g.terminal_color_3 = "#dbbc7f"
  vim.g.terminal_color_4 = "#7fbbb3"
  vim.g.terminal_color_5 = "#d699b6"
  vim.g.terminal_color_6 = "#83c092"
  vim.g.terminal_color_7 = "#d3c6aa"
  vim.g.terminal_color_8 = "#414b50"
  vim.g.terminal_color_9 = "#e67e80"
  vim.g.terminal_color_10 = "#a7c080"
  vim.g.terminal_color_11 = "#dbbc7f"
  vim.g.terminal_color_12 = "#7fbbb3"
  vim.g.terminal_color_13 = "#d699b6"
  vim.g.terminal_color_14 = "#83c092"
  vim.g.terminal_color_15 = "#d3c6aa"

  -- Neovim default higlight group
  nvim_set_hl(0, "Conceal", { fg = "#7a8478" })
  nvim_set_hl(0, "CurSearch", { fg = "#272e33", bg = "#e67e80" })
  nvim_set_hl(0, "Cursor", { fg = "#d3c6aa", bg = "#e67e80" })
  -- nvim_set_hl(0, "lCursor", {  })
  -- nvim_set_hl(0, "CursorIM", {  })
  nvim_set_hl(0, "CursorColumn", { bg = "#2e383c" })
  -- nvim_set_hl(0, "CursorLine", { bg = "#2e383c" })
  nvim_set_hl(0, "Directory", { fg = "#a7c080" })
  nvim_set_hl(0, "DiffAdd", { fg = "#3c4841" })
  nvim_set_hl(0, "DiffChange", { fg = "#384b55" })
  nvim_set_hl(0, "DiffDelete", { fg = "#493b40" })
  nvim_set_hl(0, "DiffText", { fg = "#272e33", bg = "#7fbbb3" })
  nvim_set_hl(0, "EndOfBuffer", { fg = "#272e33" })
  -- nvim_set_hl(0,'TermCursor',{})
  nvim_set_hl(0, "ErrorMsg", { fg = "#e67e80", bold = true, underline = true })
  nvim_set_hl(0, "WinSeparator", { fg = "#495156", bg = "#1e2326" })
  nvim_set_hl(0, "Folded", { fg = "#859289", bg = "#2e383c" })
  nvim_set_hl(0, "FoldColumn", { fg = "#7a8478" })
  nvim_set_hl(0, "SignColumn", { fg = "#d3c6aa" })
  nvim_set_hl(0, "IncSearch", { fg = "#272e33", bg = "#e67e80" })
  nvim_set_hl(0, "Substitute", { fg = "#272e33", bg = "#dbbc7f" })
  nvim_set_hl(0, "LineNr", { fg = "#9da9a0" })
  --nvim_set_hl(0,'LineNrAbove',{})
  --nvim_set_hl(0,'LineNrBelow',{})
  -- nvim_set_hl(0, "CursorLineNr", { fg = "#9da9a0" })
  --nvim_set_hl(0,'CursorLineFold',{})
  --nvim_set_hl(0,'CursorLineSign',{})
  nvim_set_hl(0, "MatchParen", { bg = "#495156" })
  nvim_set_hl(0, "ModeMsg", { fg = "#d3c6aa", bold = true })
  --nvim_set_hl(0,'MsgArea',{})
  --nvim_set_hl(0,'MsgSeparator',{})
  nvim_set_hl(0, "MoreMsg", { fg = "#dbbc7f", bold = true })
  nvim_set_hl(0, "NonText", { fg = "#495156" })
  nvim_set_hl(0, "Normal", { fg = "#d3c6aa", bg = "#272e33" })
  nvim_set_hl(0, "NormalFloat", { fg = "#d3c6aa", bg = "#272e33" })
  nvim_set_hl(0, "FloatBorder", { fg = "#859289", bg = "#272e33" })
  nvim_set_hl(0, "FloatTitle", { fg = "#d3c6aa", bg = "#272e33", bold = true })
  nvim_set_hl(0, "FloatFooter", { fg = "#d3c6aa", bg = "#272e33", bold = true })
  nvim_set_hl(0, "NormalNC", { fg = "#d3c6aa", bg = "#1e2326" })
  nvim_set_hl(0, "Pmenu", { fg = "#d3c6aa", bg = "#374145" })
  nvim_set_hl(0, "PmenuSel", { fg = "#272e33", bg = "#a7c080" })
  nvim_set_hl(0, "PmenuKind", { fg = "#a7c080", bg = "#374145" })
  --nvim_set_hl(0,'PmenuKindSel',{})
  nvim_set_hl(0, "PmenuExtra", { fg = "#9da9a0", bg = "#374145" })
  --nvim_set_hl(0,'PmenuExtraSel',{})
  nvim_set_hl(0, "PmenuSbar", { bg = "#374145" })
  nvim_set_hl(0, "PmenuThumb", { bg = "#7a8478" })
  nvim_set_hl(0, "Question", { fg = "#dbbc7f" })
  nvim_set_hl(0, "QuickFixLine", { fg = "#d699b6", bold = true })
  nvim_set_hl(0, "Search", { fg = "#272e33", bg = "#a7c080" })
  nvim_set_hl(0, "SpecialKey", { fg = "#dbbc7f" })
  nvim_set_hl(0, "SpellBad", { sp = "#e67e80", undercurl = true })
  nvim_set_hl(0, "SpellCap", { sp = "#7fbbb3", undercurl = true })
  nvim_set_hl(0, "SpellLocal", { sp = "#83c092", undercurl = true })
  nvim_set_hl(0, "SpellRare", { sp = "#d699b6", undercurl = true })
  nvim_set_hl(0, "StatusLine", { fg = "#859289", bg = "#374145" })
  nvim_set_hl(0, "StatusLineNC", { fg = "#859289", bg = "#2e383c" })
  nvim_set_hl(0, "TabLine", { fg = "#9da9a0", bg = "#414b50" })
  nvim_set_hl(0, "TabLineFill", { fg = "#859289", bg = "#2e383c" })
  nvim_set_hl(0, "TabLineSel", { fg = "#272e33", bg = "#a7c080" })
  nvim_set_hl(0, "Title", { fg = "#e69875", bold = true })
  nvim_set_hl(0, "Visual", { bg = "#5d4b55" })
  nvim_set_hl(0, "VisualNOS", { bg = "#5d4b55" })
  nvim_set_hl(0, "WarningMsg", { fg = "#dbbc7f", bold = true })
  nvim_set_hl(0, "Whitespace", { fg = "#495156" })
  nvim_set_hl(0, "WildMenu", { fg = "#272e33", bg = "#a7c080" })
  --nvim_set_hl(0,'WinBar',{})
  nvim_set_hl(0, "WinBarNC", { fg = "#859289" })
  --nvim_set_hl(0,'Menu',{fg=})
  -- nvim_set_hl(0,'Scrollbar',{fg=})
  --nvim_set_hl(0,'Tooltip',{fg=})

  -- Builtin Neovim syntax
  nvim_set_hl(0, "Comment", { fg = "#859289", italic = true })
  nvim_set_hl(0, "Constant", { fg = "#83c092" })
  nvim_set_hl(0, "String", { fg = "#a7c080" })
  nvim_set_hl(0, "Character", { fg = "#a7c080" })
  nvim_set_hl(0, "Number", { fg = "#d699b6" })
  nvim_set_hl(0, "Boolean", { fg = "#d699b6" })
  nvim_set_hl(0, "Float", { fg = "#d699b6" })
  nvim_set_hl(0, "Identifier", { fg = "#7fbbb3" })
  nvim_set_hl(0, "Function", { fg = "#a7c080" })
  nvim_set_hl(0, "Statement", { fg = "#e67e80" })
  nvim_set_hl(0, "Conditional", { fg = "#e67e80" })
  nvim_set_hl(0, "Repeat", { fg = "#e67e80" })
  nvim_set_hl(0, "Label", { fg = "#e69875" })
  nvim_set_hl(0, "Operator", { fg = "#e69875" })
  nvim_set_hl(0, "Keyword", { fg = "#e67e80" })
  nvim_set_hl(0, "Exception", { fg = "#e67e80" })
  nvim_set_hl(0, "PreProc", { fg = "#d699b6" })
  nvim_set_hl(0, "Include", { fg = "#d699b6" })
  nvim_set_hl(0, "Define", { fg = "#d699b6" })
  nvim_set_hl(0, "Macro", { fg = "#83c092" })
  nvim_set_hl(0, "PreCondit", { fg = "#d699b6" })
  nvim_set_hl(0, "Type", { fg = "#dbbc7f" })
  nvim_set_hl(0, "StorageClass", { fg = "#e69875" })
  nvim_set_hl(0, "Structure", { fg = "#e69875" })
  nvim_set_hl(0, "Typedef", { fg = "#dbbc7f" })
  nvim_set_hl(0, "Special", { fg = "#dbbc7f" })
  nvim_set_hl(0, "SpecialChar", { fg = "#dbbc7f" })
  nvim_set_hl(0, "Tag", { fg = "#e69875" })
  nvim_set_hl(0, "Delimiter", { fg = "#d3c6aa" })
  nvim_set_hl(0, "SpecialComment", { fg = "#859289", italic = true })
  nvim_set_hl(0, "Debug", { fg = "#e69875" })
  nvim_set_hl(0, "Underlined", { underline = true })
  nvim_set_hl(0, "Ignore", { fg = "#859289" })
  nvim_set_hl(0, "Error", { fg = "#e67e80" })
  nvim_set_hl(0, "Todo", { fg = "#272e33", bg = "#dbbc7f", bold = true })

  -- Treesitter
  nvim_set_hl(0, "@text.literal", { link = "Comment" })
  nvim_set_hl(0, "@text.reference", { link = "Identifier" })
  nvim_set_hl(0, "@text.title", { link = "Title" })
  nvim_set_hl(0, "@text.uri", { link = "Underlined" })
  nvim_set_hl(0, "@text.underline", { link = "Underlined" })
  nvim_set_hl(0, "@text.todo", { link = "Todo" })
  nvim_set_hl(0, "@comment", { link = "Comment" })
  nvim_set_hl(0, "@punctuation", { link = "Delimiter" })
  nvim_set_hl(0, "@constant", { link = "Constant" })
  nvim_set_hl(0, "@constant.builtin", { link = "Special" })
  nvim_set_hl(0, "@constant.macro", { link = "Define" })
  nvim_set_hl(0, "@define", { link = "Define" })
  nvim_set_hl(0, "@macro", { link = "Macro" })
  nvim_set_hl(0, "@string", { link = "String" })
  nvim_set_hl(0, "@string.escape", { link = "SpecialChar" })
  nvim_set_hl(0, "@string.special", { link = "SpecialChar" })
  nvim_set_hl(0, "@character", { link = "Character" })
  nvim_set_hl(0, "@character.special", { link = "SpecialChar" })
  nvim_set_hl(0, "@number", { link = "Number" })
  nvim_set_hl(0, "@boolean", { link = "Boolean" })
  nvim_set_hl(0, "@float", { link = "Float" })
  nvim_set_hl(0, "@function", { link = "Function" })
  nvim_set_hl(0, "@function.builtin", { link = "Special" })
  nvim_set_hl(0, "@function.macro", { link = "Macro" })
  nvim_set_hl(0, "@parameter", { link = "Identifier" })
  nvim_set_hl(0, "@method", { link = "Function" })
  nvim_set_hl(0, "@field", { link = "Identifier" })
  nvim_set_hl(0, "@property", { link = "Identifier" })
  nvim_set_hl(0, "@constructor", { link = "Special" })
  nvim_set_hl(0, "@conditional", { link = "Conditional" })
  nvim_set_hl(0, "@repeat", { link = "Repeat" })
  nvim_set_hl(0, "@label", { link = "Label" })
  nvim_set_hl(0, "@operator", { link = "Operator" })
  nvim_set_hl(0, "@keyword", { link = "Keyword" })
  nvim_set_hl(0, "@exception", { link = "Exception" })
  nvim_set_hl(0, "@variable", { link = "Identifier" })
  nvim_set_hl(0, "@type", { link = "Type" })
  nvim_set_hl(0, "@type.definition", { link = "Typedef" })
  nvim_set_hl(0, "@storageclass", { link = "StorageClass" })
  nvim_set_hl(0, "@structure", { link = "Structure" })
  nvim_set_hl(0, "@namespace", { link = "Identifier" })
  nvim_set_hl(0, "@include", { link = "Include" })
  nvim_set_hl(0, "@preproc", { link = "PreProc" })
  nvim_set_hl(0, "@debug", { link = "Debug" })
  nvim_set_hl(0, "@tag", { link = "Tag" })

  -- LSP
  -- nvim_set_hl(0, "LspReferenceText", {})
  -- nvim_set_hl(0, "LspReferenceRead", {})
  -- nvim_set_hl(0, "LspReferenceWrite", {})
  nvim_set_hl(0, "LspInlayHint", { fg = "#9da9a0" })
  nvim_set_hl(0, "LspCodeLens", { fg = "#7fbbb3", bg = "#384b55" })
  nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#a7c080", bg = "#3c4841" })
  nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#272e33", bg = "#a7c080" })

  -- Diagnostic
  nvim_set_hl(0, "DiagnosticError", { bg = "#493b40", sp = "#e67e80", undercurl = true })
  nvim_set_hl(0, "DiagnosticWarn", { bg = "#45443c", sp = "#dbbc7f", undercurl = true })
  nvim_set_hl(0, "DiagnosticInfo", { bg = "#384b55", sp = "#7fbbb3", undercurl = true })
  nvim_set_hl(0, "DiagnosticHint", { bg = "#3c4841", sp = "#a7c080", undercurl = true })
  -- nvim_set_hl(0, "DiagnosticOk", {})
  nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#e67e80" })
  nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#dbbc7f" })
  nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#7fbbb3" })
  nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a7c080" })
  -- nvim_set_hl(0, "DiagnosticVirtualTextOk", {})
  nvim_set_hl(0, "DiagnosticUnderlineError", { bg = "#493b40", sp = "#e67e80", undercurl = true })
  nvim_set_hl(0, "DiagnosticUnderlineWarn", { bg = "#45443c", sp = "#dbbc7f", undercurl = true })
  nvim_set_hl(0, "DiagnosticUnderlineInfo", { bg = "#384b55", sp = "#7fbbb3", undercurl = true })
  nvim_set_hl(0, "DiagnosticUnderlineHint", { bg = "#3c4841", sp = "#a7c080", undercurl = true })
  -- nvim_set_hl(0, "DiagnosticUnderlineOk", {})
  nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#e67e80" })
  nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#dbbc7f" })
  nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "#7fbbb3" })
  nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#a7c080" })
  -- nvim_set_hl(0, "DiagnosticFloatingOk", {})
  nvim_set_hl(0, "DiagnosticSignError", { fg = "#e67e80" })
  nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#dbbc7f" })
  nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#7fbbb3" })
  nvim_set_hl(0, "DiagnosticSignHint", { fg = "#a7c080" })
  -- -- nvim_set_hl(0, "DiagnosticSignOk", {})
  -- nvim_set_hl(0, "DiagnosticDeprecated", {})
  nvim_set_hl(0, "DiagnosticUnnecessary", { bg = "#45443c", sp = "#dbbc7f", undercurl = true })

  -- Git Sign (https://github.com/lewis6991/gitsigns.nvim)
  nvim_set_hl(0, "GitSignsAdd", { fg = "#a7c080", bg = "#2e383c" })
  nvim_set_hl(0, "GitSignsChange", { fg = "#7fbbb3", bg = "#2e383c" })
  nvim_set_hl(0, "GitSignsDelete", { fg = "#e67e80", bg = "#2e383c" })
  -- nvim_set_hl(0,'GitSignsChangedelete',{})
  -- nvim_set_hl(0,'GitSignsTopdelete',{})
  -- nvim_set_hl(0,'GitSignsUntracked',{})
  nvim_set_hl(0, "GitSignsAddNr", { fg = "#a7c080" })
  nvim_set_hl(0, "GitSignsChangeNr", { fg = "#7fbbb3" })
  nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#e67e80" })
  -- nvim_set_hl(0,'GitSignsChangedeleteNr',{})
  -- nvim_set_hl(0,'GitSignsTopdeleteNr',{})
  -- nvim_set_hl(0,'GitSignsUntrackedNr',{})
  nvim_set_hl(0, "GitSignsAddLn", { fg = "#3c4841" })
  nvim_set_hl(0, "GitSignsChangeLn", { fg = "#384b55" })
  -- nvim_set_hl(0,'GitSignsChangedeleteLn',{})
  -- nvim_set_hl(0,'GitSignsUntrackedLn',{})
  -- nvim_set_hl(0,'GitSignsAddPreview',{})
  -- nvim_set_hl(0,'GitSignsDeletePreview',{})
  nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#859289" })
  -- nvim_set_hl(0,'GitSignsAddInline',{})
  -- nvim_set_hl(0,'GitSignsDeleteInline',{})
  -- nvim_set_hl(0,'GitSignsChangeInline',{})
  -- nvim_set_hl(0,'GitSignsAddLnInline',{})
  -- nvim_set_hl(0,'GitSignsChangeLnInline',{})
  -- nvim_set_hl(0,'GitSignsDeleteLnInline',{})
  -- nvim_set_hl(0,'GitSignsDeleteVirtLn',{})
  -- nvim_set_hl(0,'GitSignsDeleteVirtLnInLine',{})
  -- nvim_set_hl(0,'GitSignsVirtLnum',{})

  -- Git (https://github.com/NeogitOrg/neogit)
  nvim_set_hl(0, "NeogitObjectId", { fg = "#d699b6" })
  nvim_set_hl(0, "NeogitBranch", { fg = "#e69875", bold = true })
  nvim_set_hl(0, "NeogitRemote", { fg = "#e76f91", bold = true })
  nvim_set_hl(0, "NeogitDiffAdd", { fg = "#1e2326", bg = "#83c092" })
  nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#1e2326", bg = "#a7c080" })
  nvim_set_hl(0, "NeogitDiffDelete", { fg = "#1e2326", bg = "#e69875" })
  nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#1e2326", bg = "#e67e80" })
  nvim_set_hl(0, "NeogitUnstagedchanges", { fg = "#e67e80" })
  nvim_set_hl(0, "NeogitStagedchanges", { fg = "#a7c080" })
  nvim_set_hl(0, "NeogitUnmergedInto", { fg = "#dbbc7f" })
  nvim_set_hl(0, "NeogitRecentcommits", { fg = "#7fbbb3" })
  nvim_set_hl(0, "NeogitChangeModified", { fg = "#dbbc7f" })
  nvim_set_hl(0, "NeogitChangeAdded", { fg = "#83c092" })
  nvim_set_hl(0, "NeogitChangeDeleted", { fg = "#e69875" })

  -- File manager (https://github.com/nvim-tree/nvim-tree.lua)
  nvim_set_hl(0, "NvimTreeSymlink", { fg = "#d3c6aa" })
  nvim_set_hl(0, "NvimTreeExecFile", { fg = "#d3c6aa" })
  nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#d3c6aa" })
  -- nvim_set_hl(0,'NvimTreeModifiedFile',{})
  nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#d3c6aa" })
  nvim_set_hl(0, "NvimTreeImageFile", { fg = "#d3c6aa" })
  nvim_set_hl(0, "NvimTreeFolderName", { fg = "#a7c080" })
  nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#a7c080" })
  nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#a7c080" })
  nvim_set_hl(0, "NvimTreeSymlinkFolderName", { fg = "#a7c080" })
  nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#859289" })
  -- nvim_set_hl(0,'NvimTreeFileIcon',{})
  -- nvim_set_hl(0,'NvimTreeOpenedFileIcon',{ link='NvimTreeOpenedFile' })
  -- nvim_set_hl(0,'NvimTreeSymlinkIcon',{})
  nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#e69875" })
  -- nvim_set_hl(0,'NvimTreeOpenedFolderIcon',{ link='NvimTreeFolderIcon' })
  -- nvim_set_hl(0,'NvimTreeClosedFolderIcon',{ link='NvimTreeFolderIcon' })
  -- nvim_set_hl(0,'NvimTreeFolderArrowClosed',{ link='NvimTreeIndentMarker' })
  -- nvim_set_hl(0,'NvimTreeFolderArrowOpen',{ link='NvimTreeIndentMarker' })
  nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#859289" })
  nvim_set_hl(0, "NvimTreeNormal", { fg = "#d3c6aa", bg = "#272e33" })
  nvim_set_hl(0, "NvimTreeNormalFloat", { fg = "#d3c6aa", bg = "#272e33" })
  nvim_set_hl(0, "NvimTreeNormalNC", { link = "NormalFloat" })
  -- nvim_set_hl(0,'NvimTreeLineNr',{ link='LineNr' })
  nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#272e33", bg = "#272e33" })
  -- nvim_set_hl(0, "NvimTreeEndOfBuffer", { fg = "#1e2326", bg = "#1e2326" })
  -- nvim_set_hl(0,'NvimTreePopup',{ link='Normal' })
  -- nvim_set_hl(0,'NvimTreeSignColumn',{ link='NvimTreeNormal' })
  -- nvim_set_hl(0,'NvimTreeCursorColumn',{ link='CursorColumn' })
  nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#272e33" })
  -- nvim_set_hl(0,'NvimTreeCursorLineNr',{ link='CursorLineNr' })
  -- nvim_set_hl(0,'NvimTreeStatusLine' ,{ link='StatusLine' })
  -- nvim_set_hl(0,'NvimTreeStatusLineNC',{ link='StatusLineNC' })
  -- nvim_set_hl(0,'NvimTreeCopiedHL',{ link='SpellRare' })
  -- nvim_set_hl(0,'NvimTreeCutHL',{ link='SpellBad' })
  -- nvim_set_hl(0,'NvimTreeBookmark',{})
  -- nvim_set_hl(0,'NvimTreeBookmarkHL' ,{link='SpellLocal'})
  -- nvim_set_hl(0,'NvimTreeWindowPicker',{})
  -- nvim_set_hl(0,'NvimTreeLiveFilterPrefix',{})
  -- nvim_set_hl(0,'NvimTreeLiveFilterValue',{})
  nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#dbbc7f" })
  nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#7fbbb3" })
  nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#e69875" })
  nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#d699b6" })
  nvim_set_hl(0, "NvimTreeGitNew", { fg = "#83c092" })
  nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#e67e80" })
  -- nvim_set_hl(0,'NvimTreeGitIgnored',{ link='Comment' })
  -- nvim_set_hl(0,'NvimTreeFileDirty',{ link='NvimTreeGitDirty' })
  -- nvim_set_hl(0,'NvimTreeFileStaged',{ link='NvimTreeGitStaged' })
  -- nvim_set_hl(0,'NvimTreeFileMerge',{ link='NvimTreeGitMerge' })
  -- nvim_set_hl(0,'NvimTreeFileRenamed',{ link='NvimTreeGitRenamed' })
  -- nvim_set_hl(0,'NvimTreeFileNew',{ link='NvimTreeGitNew' })
  -- nvim_set_hl(0,'NvimTreeFileDeleted',{ link='NvimTreeGitDeleted' })
  -- nvim_set_hl(0,'NvimTreeFileIgnored',{ link='NvimTreeGitIgnored' })
  -- nvim_set_hl(0,'NvimTreeFolderDirty',{ link='NvimTreeFileDirty' })
  -- nvim_set_hl(0,'NvimTreeFolderStaged',{ link='NvimTreeFileStaged' })
  -- nvim_set_hl(0,'NvimTreeFolderMerge',{ link='NvimTreeFileMerge' })
  -- nvim_set_hl(0,'NvimTreeFolderRenamed',{ link='NvimTreeFileRenamed' })
  -- nvim_set_hl(0,'NvimTreeFolderNew',{ link='NvimTreeFileNew' })
  -- nvim_set_hl(0,'NvimTreeFolderDeleted',{ link='NvimTreeFileDeleted' })
  -- nvim_set_hl(0,'NvimTreeFolderIgnored',{ link='NvimTreeFileIgnored' })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsError", { fg = "#e67e80", bg = "#2e383c" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsWarning", { fg = "#dbbc7f", bg = "#2e383c" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsInformation", { fg = "#7fbbb3", bg = "#2e383c" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsHint", { fg = "#a7c080", bg = "#2e383c" })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsErrorText',{
  -- link='NvimTreeLspDiagnosticsError' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsWarningText'   ,{
  -- link='NvimTreeLspDiagnosticsWarning' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsInfoText',{
  -- link='NvimTreeLspDiagnosticsInformation' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsHintText',{
  -- link='NvimTreeLspDiagnosticsHint' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsErrorFolderText',{
  -- link='NvimTreeLspDiagnosticsErrorText' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsWarningFolderText',{
  -- link='NvimTreeLspDiagnosticsWarningText' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsInfoFolderText',{
  -- link='NvimTreeLspDiagnosticsInfoText' })
  -- nvim_set_hl(0,'NvimTreeLspDiagnosticsHintFolderText',{
  -- link='NvimTreeLspDiagnosticsHintText' })

  -- Indent marker (https://github.com/lukas-reineke/indent-blankline.nvim)
  nvim_set_hl(0, "IblIndent", { fg = "#495156", nocombine = true })
  -- nvim_set_hl(0,'IblWhitespace',{})
  nvim_set_hl(0, "IblScope", { fg = "#859289", nocombine = true })

  -- (https://github.com/HiPhish/rainbow-delimiters.nvim)
  nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#e67e80" })
  nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#dbbc7f" })
  nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#7fbbb3" })
  nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#e69875" })
  nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#a7c080" })
  nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#d699b6" })
  nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#83c092" })

  -- (https://github.com/RRethy/vim-illuminate)
  nvim_set_hl(0, "IlluminatedWordText", { bg = "#374145" })
  nvim_set_hl(0, "IlluminatedWordRead", { bg = "#374145" })
  nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#374145" })

  -- (https://github.com/hrsh7th/nvim-cmp)
  nvim_set_hl(0, "CmpItemAbbr", { fg = "#d3c6aa" })
  nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#859289" })
  nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#a7c080", bold = true })
  nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#a7c080", bold = true })
  nvim_set_hl(0, "CmpItemKind", { fg = "#e69875" })
  nvim_set_hl(0, "CmpItemMenu", { fg = "#d3c6aa" })
  local lsp_kind_color = {
    { "Array", "#83c092" },
    { "Boolean", "#83c092" },
    { "Class", "#dbbc7f" },
    { "Color", "#83c092" },
    { "Constant", "#7fbbb3" },
    { "Constructor", "#a7c080" },
    { "Default", "#83c092" },
    { "Enum", "#dbbc7f" },
    { "EnumMember", "#d699b6" },
    { "Event", "#e69875" },
    { "Field", "#a7c080" },
    { "File", "#a7c080" },
    { "Folder", "#83c092" },
    { "Function", "#a7c080" },
    { "Interface", "#dbbc7f" },
    { "Key", "#e67e80" },
    { "Keyword", "#e67e80" },
    { "Method", "#a7c080" },
    { "Module", "#dbbc7f" },
    { "Namespace", "#d699b6" },
    { "Null", "#83c092" },
    { "Number", "#83c092" },
    { "Object", "#83c092" },
    { "Operator", "#e69875" },
    { "Package", "#d699b6" },
    { "Property", "#7fbbb3" },
    { "Reference", "#83c092" },
    { "Snippet", "#83c092" },
    { "String", "#83c092" },
    { "Struct", "#dbbc7f" },
    { "Text", "#d3c6aa" },
    { "TypeParameter", "#dbbc7f" },
    { "Unit", "#d699b6" },
    { "Value", "#d699b6" },
    { "Variable", "#7fbbb3" },
  }

  for i = 1, #lsp_kind_color do
    nvim_set_hl(0, "CmpItemKind" .. lsp_kind_color[i][1], { fg = "#374145", bg = lsp_kind_color[i][2] })
  end

  -- ('https://github.com/folke/trouble.nvim')
  -- nvim_set_hl(0, 'TroubleCount' ,{})
  -- nvim_set_hl(0, 'TroubleError' ,{})
  -- nvim_set_hl(0, 'TroubleNormal' ,{})
  -- nvim_set_hl(0, 'TroubleTextInformation' ,{})
  -- nvim_set_hl(0, 'TroubleSignWarning' ,{})
  -- nvim_set_hl(0, 'TroubleLocation' ,{})
  -- nvim_set_hl(0, 'TroubleWarning' ,{})
  -- nvim_set_hl(0, 'TroublePreview' ,{})
  -- nvim_set_hl(0, 'TroubleTextError' ,{})
  -- nvim_set_hl(0, 'TroubleSignInformation' ,{})
  -- nvim_set_hl(0, 'TroubleIndent' ,{})
  nvim_set_hl(0, "TroubleSource", { fg = "#859289" })
  -- nvim_set_hl(0, 'TroubleSignHint' ,{})
  -- nvim_set_hl(0, 'TroubleSignOther' ,{})
  -- nvim_set_hl(0, 'TroubleFoldIcon' ,{})
  -- nvim_set_hl(0, 'TroubleTextWarning' ,{})
  nvim_set_hl(0, "TroubleCode", { fg = "#859289" })
  -- nvim_set_hl(0, 'TroubleInformation' ,{})
  -- nvim_set_hl(0, 'TroubleSignError' ,{})
  -- nvim_set_hl(0, 'TroubleFile' ,{})
  -- nvim_set_hl(0, 'TroubleHint' ,{})
  -- nvim_set_hl(0, 'TroubleTextHint' ,{})
  nvim_set_hl(0, "TroubleText", { fg = "#d3c6aa" })

  -- (https://github.com/lewis6991/satellite.nvim)
  nvim_set_hl(0, "SatelliteBar", { bg = "#859289" })

  -- (https://github.com/nvim-neotest/neotest)
  -- nvim_set_hl(0, "NeotestAdapterName", {})
  -- nvim_set_hl(0, "NeotestBorder", {})
  -- nvim_set_hl(0, "NeotestDir", {})
  -- nvim_set_hl(0, "NeotestExpandMarker", {})
  -- nvim_set_hl(0, "NeotestFailed", {})
  -- nvim_set_hl(0, "NeotestFile", {})
  -- nvim_set_hl(0, "NeotestFocused", {})
  -- nvim_set_hl(0, "NeotestIndent", {fg='#495156'})
  -- nvim_set_hl(0, "NeotestMarked", {})
  -- nvim_set_hl(0, "NeotestNamespace", {})
  -- nvim_set_hl(0, "NeotestPassed", {})
  -- nvim_set_hl(0, "NeotestRunning", {})
  -- nvim_set_hl(0, "NeotestWinSelect", {})
  -- nvim_set_hl(0, "NeotestSkipped", {})
  -- nvim_set_hl(0, "NeotestTarget", {})
  -- nvim_set_hl(0, "NeotestTest", {})
  -- nvim_set_hl(0, "NeotestUnknown", {})
  -- nvim_set_hl(0, "NeotestWatching", {})
end

return Colorscheme
