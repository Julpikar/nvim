local NvimLint = {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  dependencies = {
    { "rshkarin/mason-nvim-lint", opts = { automatic_installation = false } },
  },
}

NvimLint.config = function()
  local lint = require("lint")

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      lint.try_lint()
    end,
  })

  lint.linters_by_ft = {
    python = { "ruff" },
  }
end

return NvimLint
