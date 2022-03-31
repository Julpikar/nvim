local colors = require("local.colorscheme.colors")
local Terminal = {}

function Terminal.setup(colorscheme)
	vim.g.terminal_color_0 = colors[colorscheme].grey
	vim.g.terminal_color_1 = colors[colorscheme].red
	vim.g.terminal_color_2 = colors[colorscheme].green
	vim.g.terminal_color_3 = colors[colorscheme].yellow
	vim.g.terminal_color_4 = colors[colorscheme].blue
	vim.g.terminal_color_5 = colors[colorscheme].purple
	vim.g.terminal_color_6 = colors[colorscheme].cyan
	vim.g.terminal_color_7 = colors[colorscheme].fg
	vim.g.terminal_color_8 = colors[colorscheme].black
	vim.g.terminal_color_9 = colors[colorscheme].red
	vim.g.terminal_color_10 = colors[colorscheme].green
	vim.g.terminal_color_11 = colors[colorscheme].yellow
	vim.g.terminal_color_12 = colors[colorscheme].blue
	vim.g.terminal_color_13 = colors[colorscheme].purple
	vim.g.terminal_color_14 = colors[colorscheme].cyan
	vim.g.terminal_color_15 = colors[colorscheme].fg
end

local metatable = {
	__call = function(_, colorscheme)
		local self = {}
		setmetatable(self, { __index = Terminal.setup(colorscheme) })
		return self
	end,
}

setmetatable(Terminal, metatable)

return Terminal
