local Linter = {}

function Linter.keymap()
  vim.cmd("au BufWritePost <buffer> lua require('lint').try_lint()")
end

function Linter.config()
  local linter = require("lint").linters_by_ft
  linter["python"] = {"flake8"}
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Linter})
    return self
  end
}
setmetatable(Linter, metatable)

return Linter
