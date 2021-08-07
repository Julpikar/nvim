local Debugger = {}

local function set_debugger()
  local dap = require("dap")
  dap.set_log_level("TRACE")

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

  -- Lua
  dap.adapters.nlua = function(callback, config)
    callback({type = "server", host = config.host, port = config.port})
  end

  dap.configurations.lua = {
    {
      type = "nlua",
      request = "attach",
      name = "Attach to running Neovim instance",
      host = function()
        local value = vim.fn.input("Host [127.0.0.1]: ")
        if value ~= "" then
          return value
        end
        return "127.0.0.1"
      end,
      port = function()
        local val = tonumber(vim.fn.input("Port: "))
        assert(val, "Please provide a port number")
        return val
      end
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
      port = 9003,
      serverSourceRoot = vim.fn.getcwd(),
      localSourceRoot = "${workspaceRoot}"
    },
    {
      name = "Launch currently open script",
      type = "php",
      request = "launch",
      hostname = "127.0.0.1",
      port = 9003,
      program = "${file}",
      cwd = "${fileDirname}",
      runtimeExecutable = vim.fn.exepath("php")
    }
  }
end

function Debugger.config()
  set_debugger()
end

return Debugger
