local highlight = require("local.colorscheme.highlight")
local terminal_highlight = require("local.colorscheme.terminal")

local Colorscheme = {}

function Colorscheme.custom_highlight(highlights)
  highlight.vim_highlights(highlights)
end

function Colorscheme.setup(colorscheme)
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  highlight(colorscheme)
  terminal_highlight(colorscheme)
end

return Colorscheme