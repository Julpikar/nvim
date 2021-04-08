local Snippet = {}

function Snippet.config()
  vim.g.vsnip_snippet_dir = vim.fn.expand("~/AppData/Local/nvim/snippets")
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
