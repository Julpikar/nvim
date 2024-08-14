local Conform = {
  "stevearc/conform.nvim",
  event = "VeryLazy",
}

Conform.opts = {
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    json = { "clang_format" },
    lua = { "stylua" },
    python = { "ruff_format" },
  },
  default_format_opts = { lsp_format = "fallback" },
}

Conform.keys = {
  {
    "<F9>",
    function()
      require("conform").format({ async = true }, function()
        vim.notify(
          vim.fn.expand("%") .. " has formatted",
          vim.log.levels.INFO,
          { title = "conform.nvim", icon = "󰾽" }
        )
      end)
    end,
  },
}

Conform.config = function(_, opts)
  require("conform").setup(opts)
  vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
end

return Conform
