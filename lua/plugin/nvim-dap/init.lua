local Debugger = {}

local function set_debugger()
  local dap = require("dap")

  -- Golang
  dap.adapters.go = {
    type = "executable",
    command = "node",
    args = {"C:/tools/vscode-go/dist/debugAdapter.js"}
  }
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      showLog = false,
      program = "${file}",
      dlvToolPath = vim.fn.exepath("dlv") -- Adjust to where delve is installed
    }
  }

  -- PHP
  dap.adapters.php = {
    type = "executable",
    command = "node",
    args = {"C:/tools/vscode-php-debug/out/phpDebug.js"}
  }

  dap.configurations.php = {
    {
      name = "Listen for XDebug",
      type = "php",
      request = "launch",
      hostname = "127.0.0.1",
      port = 9003
    }
  }
end

function Debugger.config()
  set_debugger()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Debugger})
    return self
  end
}
setmetatable(Debugger, metatable)

return Debugger
