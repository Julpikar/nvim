local Linter = {}

local function set_keymap()
  vim.cmd("au BufWritePost <buffer> lua require('lint').try_lint()")
end

function Linter.config()
  set_keymap()
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
