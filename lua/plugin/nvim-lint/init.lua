local lint = require("lint")
local Linter = {}

function Linter.keymap()
  local try_lint = lint.try_lint
  vim.api.nvim_create_autocmd("BufWritePost", {callback = try_lint, pattern = "<buffer>"})
end

function Linter.config()
  local linter_by_ft = lint.linters_by_ft
  linter_by_ft["python"] = {"flake8"}
end

return Linter
