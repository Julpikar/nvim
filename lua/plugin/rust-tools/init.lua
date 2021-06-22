local RustTools = {}

function RustTools.config()
  local opts = {
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
      autostart = false
    } -- rust-analyer options
  }

  require("rust-tools").setup(opts)
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = RustTools})
    return self
  end
}
setmetatable(RustTools, metatable)

return RustTools
