local Lspkind = {}

function Lspkind.config()
  require("lspkind").init(
    {
      with_text = true,
      symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "",
        Constructor = "",
        Variable = "",
        Class = "",
        Interface = "ﰮ",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "了",
        Keyword = "",
        Snippet = "﬌",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = ""
      }
    }
  )
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Lspkind})
    return self
  end
}
setmetatable(Lspkind, metatable)

return Lspkind
