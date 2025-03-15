local NvimCmp = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
      },
      config = function()
        local luasnip = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
}

NvimCmp.init = function()
  vim.opt.completeopt = { "menu", "menuone", "noinsert" }
  vim.o.pumheight = 20

  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "CmpItemAbbr", { fg = "#d3c6aa" })
  set_hl(0, "CmpItemAbbrDeprecated", { fg = "#859289" })
  set_hl(0, "CmpItemAbbrMatch", { fg = "#a7c080", bold = true })
  set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#a7c080", bold = true })
  set_hl(0, "CmpItemKind", { fg = "#e69875" })
  set_hl(0, "CmpItemMenu", { fg = "#d3c6aa" })

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
    set_hl(0, "CmpItemKind" .. lsp_kind_color[i][1], { fg = "#374145", bg = lsp_kind_color[i][2] })
  end
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

local source_name = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  luasnip = "[LuaSnip]",
  nvim_lua = "[Lua]",
}

NvimCmp.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    window = {
      documentation = cmp.config.window.bordered(),
      col_offset = -3,
      side_padding = 0,
    },
    formatting = {
      fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
      format = function(entry, vim_item)
        vim_item.menu = source_name[entry.source.name]
            and string.format("%-13s %9s", vim_item.kind, source_name[entry.source.name])
          or ""
        vim_item.kind = string.format(" %s ", kind_icons[vim_item.kind])
        return vim_item
      end,
    },

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with
        -- expand_or_locally_jumpable()
        -- that way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
    }, {
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
    }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this
  -- won't
  -- work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this
  -- won't
  -- work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return NvimCmp
