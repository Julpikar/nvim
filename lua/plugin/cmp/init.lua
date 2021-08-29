local itemkind = {
  Text = "   Text         ",
  Method = "   Method       ",
  Function = "   Function     ",
  Constructor = "   Constructor  ",
  Field = " ﴲ  Field        ",
  Variable = "[] Variable     ",
  Class = "   Class        ",
  Interface = " ﰮ  Interface    ",
  Module = "   Module       ",
  Property = " 襁 Property     ",
  Unit = "   Unit         ",
  Value = "   Value        ",
  Enum = " 練 Enum         ",
  Keyword = "   Keyword      ",
  Snippet = "   Snippet      ",
  Color = "   Color        ",
  File = "   File         ",
  Reference = "   Reference    ",
  Folder = "   Folder       ",
  EnumMember = "   EnumMember   ",
  Constant = " ﲀ  Constant     ",
  Struct = " ﳤ  Struct       ",
  Event = "   Event        ",
  Operator = "   Operator     ",
  TypeParameter = "   TypeParameter"
}

local Cmp = {}

function Cmp.config()
  vim.cmd [[set pumheight=20]]
  vim.cmd [[set shortmess+=c]]

  local cmp = require("cmp")
  cmp.setup {
    completion = {
      completeopt = "menu,menuone,noinsert"
    },
    -- You should change this example to your chosen snippet engine.
    snippet = {
      expand = function(args)
        -- You must install `vim-vsnip` if you set up as same as the following.
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    -- You must set mapping.
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm(
        {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }
      )
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", itemkind[vim_item.kind], entry.source.name)
        return vim_item
      end
    },
    -- You should specify your *installed* sources.
    sources = {
      {
        name = "buffer",
        opts = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end
        }
      },
      {name = "nvim_lsp"},
      {name = "vsnip"},
      {name = "path"}
    }
  }
end

return Cmp
