local itemkind = {
	Text = "   Text",
	Method = "   Method",
	Function = "   Function",
	Constructor = "   Constructor",
	Field = " ﴲ  Field",
	Variable = "[] Variable",
	Class = "   Class",
	Interface = " ﰮ  Interface",
	Module = "   Module",
	Property = " 襁 Property",
	Unit = "   Unit",
	Value = "   Value",
	Enum = " 練 Enum",
	Keyword = "   Keyword",
	Snippet = "   Snippet",
	Color = "   Color",
	File = "   File",
	Reference = "   Reference",
	Folder = "   Folder",
	EnumMember = "   EnumMember",
	Constant = " ﲀ  Constant",
	Struct = " ﳤ  Struct",
	Event = "   Event",
	Operator = "   Operator",
	TypeParameter = "   TypeParameter",
}

local Compe = {}

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

function Compe.config()
	vim.o.pumheight = 20
	vim.opt.shortmess:append("c")
	vim.o.completeopt = "menu,menuone,noinsert"

	local cmp = require("cmp")
	cmp.setup({
		-- You should change this example to your chosen snippet engine.
		snippet = {
			expand = function(args)
				-- You must install `vim-vsnip` if you set up as same as the following.
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		window = {
			documentation = cmp.config.window.bordered(),
		},
		-- You must set mapping.
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<Tab>"] = function(fallback)
				if vim.fn.pumvisible() == 1 then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
				elseif check_back_space() then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
				elseif vim.fn["vsnip#available"]() == 1 then
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true),
						""
					)
				else
					fallback()
				end
			end,
		}),
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = itemkind[vim_item.kind]
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					vsnip = "[VSnip]",
					path = "[Path]",
					nvim_lua = "[Lua]",
				})[entry.source.name]

				return vim_item
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "vsnip" }, -- For vsnip users.
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end,
				},
			},
		}),
		-- You should specify your *installed* sources.
	})
end

return Compe
