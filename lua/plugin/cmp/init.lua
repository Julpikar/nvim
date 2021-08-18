local itemkind = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = " ﴲ ",
  Variable = "[]",
  Class = "  ",
  Interface = " ﰮ ",
  Module = "  ",
  Property = " 襁",
  Unit = "  ",
  Value = "  ",
  Enum = " 練",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = " ﲀ ",
  Struct = " ﳤ ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  "
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
      ["<C-p>"] = cmp.mapping.prev_item(),
      ["<C-n>"] = cmp.mapping.next_item(),
      ["<C-d>"] = cmp.mapping.scroll(-4),
      ["<C-f>"] = cmp.mapping.scroll(4),
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
        vim_item.kind = string.format("%s %s", itemkind[vim_item.kind], vim_item.kind)
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
