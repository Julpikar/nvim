local Cmp = {}

function Cmp.config()
  local cmp = require("cmp")
  cmp.setup {
    -- You should change this example to your chosen snippet engine.
    snippet = {
      expand = function(args)
        -- You must install `vim-vsnip` if you set up as same as the following.
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    -- You must set mapping.
    mapping = {
      ['<C-p>'] = cmp.mapping.prev_item(),
      ['<C-n>'] = cmp.mapping.next_item(),
      ['<C-d>'] = cmp.mapping.scroll(-4),
      ['<C-f>'] = cmp.mapping.scroll(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    -- You should specify your *installed* sources.
    sources = {
      {name = "nvim_lsp"},
      {name = "buffer"},
      {name = "vsnip"},
      {name = "path"}
    }
  }
end

return Cmp
