local Colorscheme = {}

function Colorscheme.setup()
  vim.o.termguicolors = true

  local nvim_set_hl = vim.api.nvim_set_hl

  -- Terminal colors
  vim.g.terminal_color_0 = "#181818"
  vim.g.terminal_color_1 = "#7c6f64"
  vim.g.terminal_color_2 = "#ea6962"
  vim.g.terminal_color_3 = "#d8a657"
  vim.g.terminal_color_4 = "#7daea3"
  vim.g.terminal_color_5 = "#d3869b"
  vim.g.terminal_color_6 = "#89b482"
  vim.g.terminal_color_7 = "#a89984"
  vim.g.terminal_color_8 = "#7c6f64"
  vim.g.terminal_color_9 = "#ea6962"
  vim.g.terminal_color_10 = "#a9b665"
  vim.g.terminal_color_11 = "#d8a657"
  vim.g.terminal_color_12 = "#7daea3"
  vim.g.terminal_color_13 = "#d3869b"
  vim.g.terminal_color_14 = "#89b482"
  vim.g.terminal_color_15 = "#ebdbb2"

  -- Neovim default higlight group
  nvim_set_hl(0, "Conceal", { fg = "#7daea3" })
  nvim_set_hl(0, "CurSearch", { link = "IncSearch" })
  nvim_set_hl(0, "Cursor", { reverse = false })
  nvim_set_hl(0, "lCursor", { link = "Cursor" })
  -- nvim_set_hl(0, "CursorIM", {  })
  nvim_set_hl(0, "CursorColumn", { link = "CursorLine" })
  nvim_set_hl(0, "CursorLine", { bg = "#3c3836" })
  nvim_set_hl(0, "Directory", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "DiffAdd", { fg = "#a9b665", bg = "#181818", reverse = false })
  nvim_set_hl(0, "DiffChange", { fg = "#89b482", bg = "#181818", reverse = false })
  nvim_set_hl(0, "DiffDelete", { fg = "#ea6962", bg = "#181818", reverse = false })
  nvim_set_hl(0, "DiffText", { fg = "#d8a657", bg = "#181818", reverse = false })
  nvim_set_hl(0, "EndOfBuffer", { fg = "#3c3836" })
  -- nvim_set_hl(0,'TermCursor',{})
  -- nvim_set_hl(0,'TermCursorNC',{})
  nvim_set_hl(0, "ErrorMsg", { fg = "#181818", bg = "#ea6962", bold = true })
  nvim_set_hl(0, "WinSeparator", { fg = "#665c54", bg = "#181818" })
  nvim_set_hl(0, "Folded", { fg = "#7c6f64", italic = true })
  nvim_set_hl(0, "FoldColumn", { link = "LineNr" })
  -- nvim_set_hl(0, "SignColumn", { link = "Normal" })
  nvim_set_hl(0, "IncSearch", { fg = "#181818", bg = "#ea6962" })
  nvim_set_hl(0, "Substitute", { fg = "#3c3836", bg = "#d8a657" })
  nvim_set_hl(0, "LineNr", { fg = "#504945" })
  --nvim_set_hl(0,'LineNrAbove',{})
  --nvim_set_hl(0,'LineNrBelow',{})
  nvim_set_hl(0, "CursorLineNr", { fg = "#bdae93" })
  --nvim_set_hl(0,'CursorLineFold',{})
  --nvim_set_hl(0,'CursorLineSign',{})
  nvim_set_hl(0, "MatchParen", { bg = "#665c54", bold = true })
  nvim_set_hl(0, "ModeMsg", { fg = "#d8a657", bold = true })
  --nvim_set_hl(0,'MsgArea',{})
  --nvim_set_hl(0,'MsgSeparator',{})
  nvim_set_hl(0, "MoreMsg", { fg = "#d8a657", bold = true })
  nvim_set_hl(0, "NonText", { fg = "#504945" })
  nvim_set_hl(0, "Normal", { fg = "#ebdbb2", bg = "#181818" })
  nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  nvim_set_hl(0, "FloatBorder", { fg = "#859289", bg = "#3c3836" })
  nvim_set_hl(0, "FloatTitle", { fg = "#d5c4a1", bg = "#3c3836", bold = true })
  nvim_set_hl(0, "FloatFooter", { fg = "#d5c4a1", bg = "#3c3836", bold = true })
  nvim_set_hl(0, "NormalNC", { bg = "#222222" })
  nvim_set_hl(0, "Pmenu", { link = "Normal" })
  nvim_set_hl(0, "PmenuSel", { link = "Visual" })
  nvim_set_hl(0, "PmenuKind", { fg = "#7daea3", bold = true, bg = "#3c3836" })
  --nvim_set_hl(0,'PmenuKindSel',{})
  nvim_set_hl(0, "PmenuExtra", { fg = "#a89984", bg = "#3c3836" })
  --nvim_set_hl(0,'PmenuExtraSel',{})
  nvim_set_hl(0, "PmenuSbar", { bg = "#3c3836" })
  nvim_set_hl(0, "PmenuThumb", { bg = "#7c6f64" })
  nvim_set_hl(0, "Question", { fg = "#e78a4e", bold = true })
  nvim_set_hl(0, "QuickFixLine", { fg = "#181818", bg = "#d8a657", bold = true })
  nvim_set_hl(0, "Search", { fg = "#181818", bg = "#e78a4e", reverse = false })
  nvim_set_hl(0, "SpecialKey", { fg = "#a89984" })
  nvim_set_hl(0, "SpellBad", { sp = "#ea6962", undercurl = true })
  nvim_set_hl(0, "SpellCap", { sp = "#7daea3", undercurl = true })
  nvim_set_hl(0, "SpellLocal", { sp = "#89b482", undercurl = true })
  nvim_set_hl(0, "SpellRare", { sp = "#d3869b", undercurl = true })
  nvim_set_hl(0, "StatusLine", { fg = "#504945", bg = "#ebdbb2", reverse = false })
  nvim_set_hl(0, "StatusLineNC", { fg = "#3c3836", bg = "#a89984", reverse = false })
  nvim_set_hl(0, "TabLine", { fg = "#a89984", bg = "#3c3836" })
  nvim_set_hl(0, "TabLineFill", { fg = "#a89984", bg = "#181818" })
  nvim_set_hl(0, "TabLineSel", { fg = "#181818", bg = "#a89984" })
  nvim_set_hl(0, "Title", { fg = "#a9b665", bold = true })
  nvim_set_hl(0, "Visual", { bg = "#442e2d", reverse = false })
  nvim_set_hl(0, "VisualNOS", { link = "Visual" })
  nvim_set_hl(0, "WarningMsg", { fg = "#ea6962", bold = true })
  nvim_set_hl(0, "Whitespace", { fg = "#504945" })
  nvim_set_hl(0, "WildMenu", { fg = "#7daea3", bg = "#504945", bold = true })
  nvim_set_hl(0, "WinBar", { fg = "#a89984", bg = "#181818" })
  nvim_set_hl(0, "WinBarNC", { link = "WinBar" })
  --nvim_set_hl(0,'Menu',{})
  -- nvim_set_hl(0,'Scrollbar',{})
  --nvim_set_hl(0,'Tooltip',{})

  -- Builtin Neovim syntax
  nvim_set_hl(0, "Comment", { fg = "#7c6f64", italic = true })
  nvim_set_hl(0, "Constant", { fg = "#d3869b" })
  nvim_set_hl(0, "String", { fg = "#a9b665" })
  nvim_set_hl(0, "Character", { fg = "#a9b665" })
  nvim_set_hl(0, "Number", { fg = "#d3869b" })
  nvim_set_hl(0, "Boolean", { fg = "#d3869b" })
  nvim_set_hl(0, "Float", { fg = "#d3869b" })
  nvim_set_hl(0, "Identifier", { fg = "#7daea3" })
  nvim_set_hl(0, "Function", { fg = "#a9b665" })
  nvim_set_hl(0, "Statement", { fg = "#ea6962" })
  nvim_set_hl(0, "Conditional", { fg = "#ea6962" })
  nvim_set_hl(0, "Repeat", { fg = "#ea6962" })
  nvim_set_hl(0, "Label", { fg = "#ea6962" })
  nvim_set_hl(0, "Operator", { fg = "#e78a4e", italic = true })
  nvim_set_hl(0, "Keyword", { fg = "#ea6962" })
  nvim_set_hl(0, "Exception", { fg = "#ea6962" })
  nvim_set_hl(0, "PreProc", { fg = "#89b482" })
  nvim_set_hl(0, "Include", { fg = "#89b482" })
  nvim_set_hl(0, "Define", { fg = "#89b482" })
  nvim_set_hl(0, "Macro", { fg = "#89b482" })
  nvim_set_hl(0, "PreCondit", { fg = "#89b482" })
  nvim_set_hl(0, "Type", { fg = "#d8a657" })
  nvim_set_hl(0, "StorageClass", { fg = "#e78a4e" })
  nvim_set_hl(0, "Structure", { fg = "#89b482" })
  nvim_set_hl(0, "Typedef", { fg = "#d8a657" })
  nvim_set_hl(0, "Special", { fg = "#e78a4e" })
  nvim_set_hl(0, "SpecialChar", { fg = "#d8a657" })
  nvim_set_hl(0, "Tag", { fg = "#e78a4e" })
  nvim_set_hl(0, "Delimiter", { fg = "#d5c4a1" })
  nvim_set_hl(0, "SpecialComment", { fg = "#859289", italic = true })
  nvim_set_hl(0, "Debug", { fg = "#e78a4e" })
  nvim_set_hl(0, "Underlined", { fg = "#7daea3", underline = true })
  nvim_set_hl(0, "Ignore", { fg = "#859289" })
  nvim_set_hl(0, "Error", { fg = "#ea6962", bold = true, reverse = false })
  nvim_set_hl(0, "Todo", { fg = "#181818", bg = "#d8a657", bold = true, italic = true })

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
  nvim_set_hl(0, "LspReferenceText", { bold = true })
  nvim_set_hl(0, "LspReferenceRead", { bold = true })
  nvim_set_hl(0, "LspReferenceWrite", { bold = true })
  nvim_set_hl(0, "LspInlayHint", { fg = "#7c6f64", italic = true })
  nvim_set_hl(0, "LspCodeLens", { fg = "#7c6f64" })
  nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#7daea3", bold = true, bg = "#3c4841" })
  nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })

  -- Diagnostic
  nvim_set_hl(0, "DiagnosticError", { sp = "#ea6962", undercurl = true })
  nvim_set_hl(0, "DiagnosticWarn", { sp = "#d8a657", undercurl = true })
  nvim_set_hl(0, "DiagnosticInfo", { sp = "#7daea3", undercurl = true })
  nvim_set_hl(0, "DiagnosticHint", { sp = "#a9b665", undercurl = true })
  -- nvim_set_hl(0, "DiagnosticOk", {})
  nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ea6962" })
  nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#d8a657" })
  nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#7daea3" })
  nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "DiagnosticVirtualTextOk", {})
  nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "#ea6962", undercurl = true })
  nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "#d8a657", undercurl = true })
  nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = "#7daea3", undercurl = true })
  nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = "#a9b665", undercurl = true })
  -- nvim_set_hl(0, "DiagnosticUnderlineOk", {})
  nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#ea6962" })
  nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#d8a657" })
  nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "#7daea3" })
  nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#7daea3", bold = true })
  -- nvim_set_hl(0, "DiagnosticFloatingOk", {})
  nvim_set_hl(0, "DiagnosticSignError", { fg = "#ea6962" })
  nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#d8a657" })
  nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#7daea3" })
  nvim_set_hl(0, "DiagnosticSignHint", { fg = "#7daea3", bold = true })
  -- nvim_set_hl(0, "DiagnosticSignOk", {})
  -- nvim_set_hl(0, "DiagnosticDeprecated", {})
  nvim_set_hl(0, "DiagnosticUnnecessary", { bg = "#504945", sp = "#d8a657", undercurl = true })

  -- Git Sign (https://github.com/lewis6991/gitsigns.nvim)
  nvim_set_hl(0, "GitSignsAdd", { fg = "#a9b665", bg = "#181818", reverse = false })
  nvim_set_hl(0, "GitSignsChange", { fg = "#89b482", bg = "#181818", reverse = false })
  nvim_set_hl(0, "GitSignsDelete", { fg = "#ea6962", bg = "#181818", reverse = false })
  -- nvim_set_hl(0,'GitSignsChangedelete',{})
  -- nvim_set_hl(0,'GitSignsTopdelete',{})
  -- nvim_set_hl(0,'GitSignsUntracked',{})
  nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAdd" })
  nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChange" })
  nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDelete" })
  -- nvim_set_hl(0,'GitSignsChangedeleteNr',{})
  nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDelete" })
  -- nvim_set_hl(0,'GitSignsUntrackedNr',{})
  nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAdd" })
  nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChange" })
  nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsDelete" })
  -- nvim_set_hl(0,'GitSignsUntrackedLn',{})
  -- nvim_set_hl(0,'GitSignsAddPreview',{})
  -- nvim_set_hl(0,'GitSignsDeletePreview',{})
  nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#7daea3" })
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
  nvim_set_hl(0, "NeogitObjectId", { fg = "#d3869b" })
  nvim_set_hl(0, "NeogitBranch", { fg = "#e78a4e", bold = true })
  nvim_set_hl(0, "NeogitRemote", { fg = "#8f3f71", bold = true })
  nvim_set_hl(0, "NeogitDiffAdd", { fg = "#181818", bg = "#89b482" })
  nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#181818", bg = "#a9b665" })
  nvim_set_hl(0, "NeogitDiffDelete", { fg = "#181818", bg = "#e78a4e" })
  nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#181818", bg = "#ea6962" })
  nvim_set_hl(0, "NeogitUnstagedchanges", { fg = "#ea6962" })
  nvim_set_hl(0, "NeogitStagedchanges", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "NeogitUnmergedInto", { fg = "#d8a657" })
  nvim_set_hl(0, "NeogitRecentcommits", { fg = "#7daea3" })
  nvim_set_hl(0, "NeogitChangeModified", { fg = "#d8a657" })
  nvim_set_hl(0, "NeogitChangeAdded", { fg = "#89b482" })
  nvim_set_hl(0, "NeogitChangeDeleted", { fg = "#e78a4e" })

  -- File manager (https://github.com/nvim-tree/nvim-tree.lua)
  nvim_set_hl(0, "NvimTreeSymlink", { fg = "#d5c4a1" })
  nvim_set_hl(0, "NvimTreeExecFile", { fg = "#d5c4a1" })
  nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#d5c4a1" })
  -- nvim_set_hl(0,'NvimTreeModifiedFile',{})
  nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#d5c4a1" })
  nvim_set_hl(0, "NvimTreeImageFile", { fg = "#d5c4a1" })
  nvim_set_hl(0, "NvimTreeFolderName", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "NvimTreeSymlinkFolderName", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#859289" })
  -- nvim_set_hl(0,'NvimTreeFileIcon',{})
  nvim_set_hl(0, "NvimTreeOpenedFileIcon", { link = "NvimTreeOpenedFile" })
  -- nvim_set_hl(0,'NvimTreeSymlinkIcon',{})
  nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#e78a4e" })
  nvim_set_hl(0, "NvimTreeOpenedFolderIcon", { link = "NvimTreeFolderIcon" })
  nvim_set_hl(0, "NvimTreeClosedFolderIcon", { link = "NvimTreeFolderIcon" })
  nvim_set_hl(0, "NvimTreeFolderArrowClosed", { link = "NvimTreeIndentMarker" })
  nvim_set_hl(0, "NvimTreeFolderArrowOpen", { link = "NvimTreeIndentMarker" })
  nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#859289" })
  nvim_set_hl(0, "NvimTreeNormal", { fg = "#d5c4a1", bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeNormalFloat", { fg = "#d5c4a1", bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeNormalNC", { link = "NormalFloat" })
  nvim_set_hl(0, "NvimTreeLineNr", { link = "LineNr" })
  -- nvim_set_hl(0, "NvimTreeWinSeparator", {})
  -- nvim_set_hl(0, "NvimTreeEndOfBuffer", {})
  nvim_set_hl(0, "NvimTreePopup", { link = "Normal" })
  nvim_set_hl(0, "NvimTreeSignColumn", { link = "NvimTreeNormal" })
  nvim_set_hl(0, "NvimTreeCursorColumn", { link = "CursorColumn" })
  nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeCursorLineNr", { link = "CursorLineNr" })
  nvim_set_hl(0, "NvimTreeStatusLine", { link = "StatusLine" })
  nvim_set_hl(0, "NvimTreeStatusLineNC", { link = "StatusLineNC" })
  nvim_set_hl(0, "NvimTreeCopiedHL", { link = "SpellRare" })
  nvim_set_hl(0, "NvimTreeCutHL", { link = "SpellBad" })
  -- nvim_set_hl(0,'NvimTreeBookmark',{})
  nvim_set_hl(0, "NvimTreeBookmarkHL", { link = "SpellLocal" })
  -- nvim_set_hl(0,'NvimTreeWindowPicker',{})
  -- nvim_set_hl(0,'NvimTreeLiveFilterPrefix',{})
  -- nvim_set_hl(0,'NvimTreeLiveFilterValue',{})
  nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#d8a657" })
  nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#7daea3" })
  nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#e78a4e" })
  nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#d3869b" })
  nvim_set_hl(0, "NvimTreeGitNew", { fg = "#89b482" })
  nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ea6962" })
  nvim_set_hl(0, "NvimTreeGitIgnored", { link = "Comment" })
  nvim_set_hl(0, "NvimTreeFileDirty", { link = "NvimTreeGitDirty" })
  nvim_set_hl(0, "NvimTreeFileStaged", { link = "NvimTreeGitStaged" })
  nvim_set_hl(0, "NvimTreeFileMerge", { link = "NvimTreeGitMerge" })
  nvim_set_hl(0, "NvimTreeFileRenamed", { link = "NvimTreeGitRenamed" })
  nvim_set_hl(0, "NvimTreeFileNew", { link = "NvimTreeGitNew" })
  nvim_set_hl(0, "NvimTreeFileDeleted", { link = "NvimTreeGitDeleted" })
  nvim_set_hl(0, "NvimTreeFileIgnored", { link = "NvimTreeGitIgnored" })
  nvim_set_hl(0, "NvimTreeFolderDirty", { link = "NvimTreeFileDirty" })
  nvim_set_hl(0, "NvimTreeFolderStaged", { link = "NvimTreeFileStaged" })
  nvim_set_hl(0, "NvimTreeFolderMerge", { link = "NvimTreeFileMerge" })
  nvim_set_hl(0, "NvimTreeFolderRenamed", { link = "NvimTreeFileRenamed" })
  nvim_set_hl(0, "NvimTreeFolderNew", { link = "NvimTreeFileNew" })
  nvim_set_hl(0, "NvimTreeFolderDeleted", { link = "NvimTreeFileDeleted" })
  nvim_set_hl(0, "NvimTreeFolderIgnored", { link = "NvimTreeFileIgnored" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsError", { fg = "#ea6962", bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsWarning", { fg = "#d8a657", bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsInformation", { fg = "#7daea3", bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsHint", { fg = "#a9b665", bold = true, bg = "#3c3836" })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsErrorText", {
    link = "NvimTreeLspDiagnosticsError",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsWarningText", {
    link = "NvimTreeLspDiagnosticsWarning",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsInfoText", {
    link = "NvimTreeLspDiagnosticsInformation",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsHintText", {
    link = "NvimTreeLspDiagnosticsHint",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsErrorFolderText", {
    link = "NvimTreeLspDiagnosticsErrorText",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsWarningFolderText", {
    link = "NvimTreeLspDiagnosticsWarningText",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsInfoFolderText", {
    link = "NvimTreeLspDiagnosticsInfoText",
  })
  nvim_set_hl(0, "NvimTreeLspDiagnosticsHintFolderText", {
    link = "NvimTreeLspDiagnosticsHintText",
  })

  -- Indent marker (https://github.com/lukas-reineke/indent-blankline.nvim)
  nvim_set_hl(0, "IblIndent", { fg = "#504945", nocombine = true })
  -- nvim_set_hl(0,'IblWhitespace',{})
  nvim_set_hl(0, "IblScope", { fg = "#859289", nocombine = true })

  -- (https://github.com/HiPhish/rainbow-delimiters.nvim)
  nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ea6962" })
  nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#d8a657" })
  nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#7daea3" })
  nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#e78a4e" })
  nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#7daea3", bold = true })
  nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#d3869b" })
  nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#89b482" })

  -- (https://github.com/RRethy/vim-illuminate)
  nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3836" })
  nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3836" })
  nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3836" })

  -- (https://github.com/hrsh7th/nvim-cmp)
  nvim_set_hl(0, "CmpItemAbbr", { fg = "#d5c4a1" })
  nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#859289" })
  nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7daea3", bold = true, bold = true })
  nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#7daea3", bold = true, bold = true })
  nvim_set_hl(0, "CmpItemKind", { fg = "#e78a4e" })
  nvim_set_hl(0, "CmpItemMenu", { fg = "#d5c4a1" })
  local lsp_kind_color = {
    { "Array", "#89b482" },
    { "Boolean", "#89b482" },
    { "Class", "#d8a657" },
    { "Color", "#89b482" },
    { "Constant", "#7daea3" },
    { "Constructor", "#a9b665" },
    { "Default", "#89b482" },
    { "Enum", "#d8a657" },
    { "EnumMember", "#d3869b" },
    { "Event", "#e78a4e" },
    { "Field", "#a9b665" },
    { "File", "#a9b665" },
    { "Folder", "#89b482" },
    { "Function", "#a9b665" },
    { "Interface", "#d8a657" },
    { "Key", "#ea6962" },
    { "Keyword", "#ea6962" },
    { "Method", "#a9b665" },
    { "Module", "#d8a657" },
    { "Namespace", "#d3869b" },
    { "Null", "#89b482" },
    { "Number", "#89b482" },
    { "Object", "#89b482" },
    { "Operator", "#e78a4e" },
    { "Package", "#d3869b" },
    { "Property", "#7daea3" },
    { "Reference", "#89b482" },
    { "Snippet", "#89b482" },
    { "String", "#89b482" },
    { "Struct", "#d8a657" },
    { "Text", "#d5c4a1" },
    { "TypeParameter", "#d8a657" },
    { "Unit", "#d3869b" },
    { "Value", "#d3869b" },
    { "Variable", "#7daea3" },
  }

  for i = 1, #lsp_kind_color do
    nvim_set_hl(0, "CmpItemKind" .. lsp_kind_color[i][1], { fg = "#3c3836", bg = lsp_kind_color[i][2] })
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
  nvim_set_hl(0, "TroubleText", { fg = "#d5c4a1" })

  -- (https://github.com/lewis6991/satellite.nvim)
  nvim_set_hl(0, "SatelliteBar", { bg = "#d8a657" })
end

return Colorscheme
