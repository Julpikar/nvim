local Conform = {}

function Conform.config()
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      cmake = { "cmake_format" },
      json = { "clang_format" },
      lua = { "stylua" },
    },
  })

  vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
  vim.keymap.set({ "n", "v" }, "<F9>", function()
    conform.format({ lsp_fallback = true }, function()
      vim.notify(vim.fn.expand("%") .. " has formatted", vim.log.levels.INFO, { title = "conform.nvim", icon = "󰾽" })
    end)
  end)
end

return Conform
