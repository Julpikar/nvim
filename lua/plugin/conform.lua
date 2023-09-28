local Conform = {}

function Conform.config()
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      cmake = { "cmake_format" },
      json = { "prettier" },
      lua = { "stylua" },
    },
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })
  vim.keymap.set({ "n", "v" }, "<F9>", conform.format)
end

return Conform
