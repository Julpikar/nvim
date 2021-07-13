local EditorConfig = {}

function EditorConfig.config()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = EditorConfig})
    return self
  end
}
setmetatable(EditorConfig, metatable)

return EditorConfig
