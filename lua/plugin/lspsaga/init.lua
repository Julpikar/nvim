local Lspsaga = {}

function Lspsaga.config()
  require("lspsaga").init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = ""
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Lspsaga})
    return self
  end
}
setmetatable(Lspsaga, metatable)

return Lspsaga
