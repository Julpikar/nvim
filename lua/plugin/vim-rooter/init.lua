local g = vim.g

local Rooter = {}

function Rooter.config()
  g.rooter_patterns = {".git", "Makefile", "*.sln", "build/env.sh"}
  g.rooter_change_directory_for_non_project_files = "current"
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Rooter})
    return self
  end
}
setmetatable(Rooter, metatable)

return Rooter
