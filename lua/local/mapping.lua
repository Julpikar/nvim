local opts = { noremap = true, silent = true }

local keymaps = {
	navigate = {
		{ "n", "<c-s-left>", "<CMD>wincmd h<CR>", opts },
		{ "n", "<c-s-up>", "<CMD>wincmd k<CR>", opts },
		{ "n", "<c-s-right>", "<CMD>wincmd l<CR>", opts },
		{ "n", "<c-s-down>", "<CMD>wincmd j<CR>", opts },
		{ "n", "<c-s-home>", "<CMD>wincmd p<CR>", opts },
	},
	stop = {
		{{ "n", "i", "v", "s", "x", "c", "o" },'<c-z>','<nop>'},
	},
}

local Mapping = {}

function Mapping.setup()
	local keymap_set = vim.keymap.set
	for _, group in pairs(keymaps) do
		for _, keymap in pairs(group) do
			keymap_set(unpack(keymap))
		end
	end
end

return Mapping
