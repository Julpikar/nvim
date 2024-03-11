local NvimLint = {}

function NvimLint.config()
  local lint = require("lint")

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      lint.try_lint()
    end,
  })

  lint.linters_by_ft = {
    javascript = { "biomejs" },
  }
end

return NvimLint
