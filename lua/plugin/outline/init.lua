local Outline = {}

function Outline.config()
	vim.keymap.set({ "n", "i", "v" }, "<F9>", "<CMD>SymbolsOutline<CR>", { silent = true })
end

return Outline
