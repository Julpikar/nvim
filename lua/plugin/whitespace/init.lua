local Whitespace = {}

function Whitespace.config()
  vim.g.better_whitespace_filetypes_blacklist = {"dashboard", "lspsagafinder", "packer"}
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Whitespace})
    return self
  end
}
setmetatable(Whitespace, metatable)

return Whitespace
