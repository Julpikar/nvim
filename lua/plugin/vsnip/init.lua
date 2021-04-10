local Snippet = {}

function Snippet.config()
  local config_path = vim.fn.stdpath("config")
  vim.g.vsnip_snippet_dir = vim.fn.expand(config_path .. "/snippets")
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Snippet})
    return self
  end
}
setmetatable(Snippet, metatable)

return Snippet
