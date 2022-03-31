local Easyalign = {}

function Easyalign.keymap()
	local keymap_set = vim.keymap.set
	-- Start interactive EasyAlign in visual mode (e.g. vipga)
	keymap_set("x", "ga", "<Plug>(EasyAlign)", { silent = true })

	-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
	keymap_set("n", "ga", "<Plug>(EasyAlign)", { silent = true })
end

return Easyalign
