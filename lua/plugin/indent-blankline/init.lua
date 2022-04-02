local M = {}

function M.config()
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#282c34 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1f2329 gui=nocombine]])

	require("indent_blankline").setup({
		filetype_exclude = { "dashboard",'help', "NvimTree", "Outline" ,'packer'},
		char = "",
		char_highlight_list = {
			"IndentBlanklineIndent1",
			"IndentBlanklineIndent2",
		},
		space_char_highlight_list = {
			"IndentBlanklineIndent1",
			"IndentBlanklineIndent2",
		},
		show_trailing_blankline_indent = false,
	})
end

return M
