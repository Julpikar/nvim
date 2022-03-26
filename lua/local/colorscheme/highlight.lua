local colors = require("local.colorscheme.colors")
local highlight = vim.api.nvim_set_hl
local set_hl_ns = vim.api.nvim__set_hl_ns
local create_namespace = vim.api.nvim_create_namespace
local Highlight = {}
local hl = {plugins = {}}

local function set_color(color)
  local c = {
    Fg = {fg = color.fg},
    Grey = {fg = color.grey},
    Red = {fg = color.red},
    Cyan = {fg = color.cyan},
    Yellow = {fg = color.yellow},
    Orange = {fg = color.orange},
    Green = {fg = color.green},
    Blue = {fg = color.blue},
    Purple = {fg = color.purple}
  }

  hl.common = {
    Normal = {fg = color.fg, bg = color.bg1},
    Terminal = {fg = color.fg, bg = color.bg1},
    EndOfBuffer = {fg = color.bg3, bg = color.bg1},
    FoldColumn = {fg = color.fg, bg = color.bg2},
    Folded = {fg = color.fg, bg = color.bg2},
    SignColumn = {fg = color.fg, bg = color.bg1},
    ToolbarLine = {fg = color.fg},
    Cursor = {reverse = true},
    vCursor = {reverse = true},
    iCursor = {reverse = true},
    lCursor = {reverse = true},
    CursorIM = {reverse = true},
    CursorColumn = {bg = color.bg2},
    CursorLine = {bg = color.bg2},
    ColorColumn = {bg = color.bg2},
    CursorLineNr = {fg = color.fg},
    LineNr = {fg = color.grey},
    Conceal = {fg = color.grey, bg = color.bg2},
    DiffAdd = {fg = color.none, bg = color.diff_add},
    DiffChange = {fg = color.none, bg = color.diff_change},
    DiffDelete = {fg = color.diff_delete, bg = color.diff_delete},
    DiffText = {fg = color.none, bg = color.diff_text},
    DiffAdded = c.Green,
    DiffRemoved = c.Red,
    DiffFile = c.Cyan,
    DiffIndexLine = c.Grey,
    Directory = {fg = color.blue},
    ErrorMsg = {fg = color.red, bold = true, underline = true},
    WarningMsg = {fg = color.yellow, bold = true},
    MoreMsg = {fg = color.blue, bold = true},
    IncSearch = {fg = color.bg1, bg = color.orange},
    Search = {fg = color.bg1, bg = color.bg_yellow},
    MatchParen = {fg = color.none, bg = color.grey},
    NonText = {fg = color.grey},
    Whitespace = {fg = color.grey},
    SpecialKey = {fg = color.grey},
    Pmenu = {fg = color.fg, bg = color.bg2},
    PmenuSbar = {fg = color.none, bg = color.bg2},
    PmenuSel = {fg = color.bg1, bg = color.bg_blue},
    WildMenu = {fg = color.bg1, bg = color.blue},
    PmenuThumb = {fg = color.none, bg = color.grey},
    Question = {fg = color.yellow},
    SpellBad = {fg = color.red, underline = true, sp = color.red},
    SpellCap = {fg = color.yellow, underline = true, sp = color.yellow},
    SpellLocal = {fg = color.blue, underline = true, sp = color.blue},
    SpellRare = {fg = color.purple, underline = true, sp = color.purple},
    StatusLine = {fg = color.fg, bg = color.bg3},
    StatusLineTerm = {fg = color.fg, bg = color.bg3},
    StatusLineNC = {fg = color.grey, bg = color.bg2},
    StatusLineTermNC = {fg = color.grey, bg = color.bg2},
    TabLine = {fg = color.fg, bg = color.bg2},
    TabLineFill = {fg = color.grey, bg = color.bg2},
    TabLineSel = {fg = color.bg1, bg = color.fg},
    VertSplit = {fg = color.bg2},
    Visual = {bg = color.bg4},
    VisualNOS = {fg = color.none, bg = color.bg3, underline = true},
    QuickFixLine = {fg = color.blue, underline = true},
    Debug = {fg = color.yellow},
    debugPC = {fg = color.bg1, bg = color.green},
    debugBreakpoint = {fg = color.bg1, bg = color.red},
    ToolbarButton = {fg = color.bg1, bg = color.bg_blue}
  }

  hl.treesitter = {
    TSAnnotation = c.Fg,
    TSAttribute = c.Cyan,
    TSBoolean = c.Orange,
    TSCharacter = c.Fg,
    TSComment = c.Grey,
    TSConditional = c.Purple,
    TSConstant = c.Orange,
    TSConstBuiltin = c.Orange,
    TSConstMacro = c.Orange,
    TSConstructor = c.Yellow,
    TSError = c.Fg,
    TSException = c.Purple,
    TSField = c.Cyan,
    TSFloat = c.Orange,
    TSFunction = c.Blue,
    TSFuncBuiltin = c.Cyan,
    TSFuncMacro = c.Fg,
    TSInclude = c.Purple,
    TSKeyword = c.Purple,
    TSKeywordFunction = c.Purple,
    TSKeywordOperator = c.Purple,
    TSLabel = c.Red,
    TSMethod = c.Blue,
    TSNamespace = c.Fg,
    TSNone = c.Fg,
    TSNumber = c.Orange,
    TSOperator = c.Fg,
    TSParameter = c.Red,
    TSParameterReference = c.Fg,
    TSProperty = c.Cyan,
    TSPunctDelimiter = c.Fg,
    TSPunctBracket = c.Fg,
    TSPunctSpecial = c.Fg,
    TSRepeat = c.Purple,
    TSString = c.Green,
    TSStringRegex = c.Orange,
    TSStringEscape = c.Red,
    TSSymbol = c.Cyan,
    TSTag = c.Red,
    TSTagDelimiter = c.Red,
    TSText = c.Fg,
    TSStrong = c.Fg,
    TSEmphasis = c.Fg,
    TSUnderline = c.Fg,
    TSStrike = c.Fg,
    TSTitle = c.Fg,
    TSLiteral = c.Green,
    TSURI = c.Fg,
    TSMath = c.Fg,
    TSTextReference = c.Fg,
    TSEnviroment = c.Fg,
    TSEnviromentName = c.Fg,
    TSNote = c.Fg,
    TSWarning = c.Fg,
    TSDanger = c.Fg,
    TSType = c.Yellow,
    TSTypeBuiltin = c.Orange,
    TSVariable = c.Fg,
    TSVariableBuiltin = c.Red
  }

  hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = c.Orange,
    LspCxxHlGroupMemberVariable = c.Orange,
    LspCxxHlGroupNamespace = c.Blue,
    LspCxxHlSkippedRegion = c.Grey,
    LspCxxHlSkippedRegionBeginEnd = c.Red,
    LspDiagnosticsDefaultError = {fg = c.dark_red},
    LspDiagnosticsDefaultHint = {fg = c.dark_purple},
    LspDiagnosticsDefaultInformation = {fg = c.dark_cyan},
    LspDiagnosticsDefaultWarning = {fg = c.dark_yellow},
    LspDiagnosticsUnderlineError = {underline = true, sp = c.red},
    LspDiagnosticsUnderlineHint = {underline = true, sp = c.purple},
    LspDiagnosticsUnderlineInformation = {underline = true, sp = c.blue},
    LspDiagnosticsUnderlineWarning = {underline = true, sp = c.yellow}
  }

  hl.plugins.whichkey = {
    WhichKey = c.Red,
    WhichKeyDesc = c.Blue,
    WhichKeyGroup = c.Orange,
    WhichKeySeperator = c.Green
  }

  hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.green},
    GitGutterChange = {fg = c.blue},
    GitGutterDelete = {fg = c.red}
  }

  hl.plugins.hop = {
    HopNextKey = {fg = c.bg1, bg = c.orange},
    HopNextKey1 = {fg = c.bg1, bg = c.orange},
    HopNextKey2 = {fg = c.bg1, bg = c.bg_yellow},
    HopUnmatched = {fg = c.fg, bg = c.bg2}
  }

  hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, bold = true},
    DiffviewFilePanelCounter = {fg = c.purple, bold = true},
    DiffviewFilePanelFileName = c.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = c.Grey,
    DiffviewFilePanelPath = c.Grey,
    DiffviewFilePanelInsertions = c.Green,
    DiffviewFilePanelDeletions = c.Red,
    DiffviewStatusAdded = c.Green,
    DiffviewStatusUntracked = c.Blue,
    DiffviewStatusModified = c.Blue,
    DiffviewStatusRenamed = c.Blue,
    DiffviewStatusCopied = c.Blue,
    DiffviewStatusTypeChange = c.Blue,
    DiffviewStatusUnmerged = c.Blue,
    DiffviewStatusUnknown = c.Red,
    DiffviewStatusDeleted = c.Red,
    DiffviewStatusBroken = c.Red
  }

  hl.plugins.gitsigns = {
    GitSignsAdd = c.Green,
    GitSignsAddLn = c.Green,
    GitSignsAddNr = c.Green,
    GitSignsChange = c.Blue,
    GitSignsChangeLn = c.Blue,
    GitSignsChangeNr = c.Blue,
    GitSignsDelete = c.Red,
    GitSignsDeleteLn = c.Red,
    GitSignsDeleteNr = c.Red
  }

  hl.plugins.nvim_tree = {
    NvimTreeNormal = {fg = c.fg, bg = c.bg0},
    NvimTreeEndOfBuffer = {fg = c.bg3, bg = c.bg0},
    NvimTreeRootFolder = {fg = c.yellow, bold = true},
    NvimTreeGitDirty = c.Yellow,
    NvimTreeGitNew = c.Green,
    NvimTreeGitDeleted = c.Red,
    NvimTreeSpecialFile = {fg = c.yellow, underline = true},
    NvimTreeIndentMarker = c.Fg,
    NvimTreeImageFile = {fg = c.dark_purple},
    NvimTreeSymlink = c.Purple,
    NvimTreeFolderName = c.Blue
  }

  hl.plugins.telescope = {
    TelescopeBorder = c.Green,
    TelescopeMatching = c.Yellow,
    TelescopePromptPrefix = c.Blue,
    TelescopeSelection = {bg = c.bg3},
    TelescopeSelectionCaret = c.Blue
  }

  hl.plugins.dashboard = {
    DashboardShortCut = c.Yellow,
    DashboardHeader = c.Green,
    DashboardCenter = c.Blue,
    DashboardFooter = {fg = c.cyan, italic = true}
  }
end

local function load_highlights(ns, highlights)
  for group_name, group_settings in pairs(highlights) do
    highlight(ns, group_name, group_settings)
  end
end

local function gui(group_settings)
  if group_settings.bold then
    return "bold"
  elseif group_settings.underline then
    return "underline"
  elseif group_settings.italic then
    return "italic"
  elseif group_settings.reverse then
    return "reverse"
  else
    return "NONE"
  end
end

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    local fg = group_settings.fg and "guifg=" .. group_settings.fg or "guifg=NONE"
    local bg = group_settings.bg and "guibg=" .. group_settings.bg or "guibg=NONE"
    vim.cmd("highlight " .. group_name .. " " .. "gui=" .. gui(group_settings) .. " " .. fg .. " " .. bg)
  end
end

function Highlight.vim_highlights(highlights)
  vim_highlights(highlights)
end

function Highlight.setup(colorscheme)
  local color = colors[colorscheme]
  set_color(color)
  vim_highlights(hl.common)
  local ns = create_namespace(colorscheme)
  load_highlights(ns, hl.treesitter)
  set_hl_ns(ns)
  for _, group in pairs(hl.plugins) do
    vim_highlights(group)
  end
end

local metatable = {
  __call = function(_, colorscheme)
    local self = {}
    setmetatable(self, {__index = Highlight.setup(colorscheme)})
    return self
  end
}

setmetatable(Highlight, metatable)

return Highlight
