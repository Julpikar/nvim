local NvimDap = {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "jay-babu/mason-nvim-dap.nvim", config = true },
  },
}

NvimDap.keys = {
  {
    "<F8>",
    function()
      require("dap").continue()
    end,
  },
  {
    "<F10>",
    function()
      require("dap").step_over()
    end,
  },
  {
    "<F11>",
    function()
      require("dap").step_into()
    end,
  },
  {
    "<F12>",
    function()
      require("dap").step_out()
    end,
  },
  {
    "<Leader>b",
    function()
      require("dap").toggle_breakpoint()
    end,
  },
  {
    "<Leader>B",
    function()
      require("dap").set_breakpoint()
    end,
  },
  {
    "<Leader>lp",
    function()
      local dap = require("dap")
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end,
  },
  {
    "<Leader>dr",
    function()
      require("dap").repl.open()
    end,
  },
  {
    "<Leader>dl",
    function()
      require("dap").run_last()
    end,
  },
}

NvimDap.config = function()
  local dap = require("dap")

  -- Adapter Definition
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- CHANGE THIS to your path!
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      detached = false,
    },
  }

  -- Language Configuration
  dap.configurations.c = {
    {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = function()
        local path = vim.fn.input({
          prompt = "Path to executable: ",
          default = vim.fn.getcwd() .. "\\",
          completion = "file",
        })
        return (path and path ~= "") and path or dap.ABORT
      end,
      stopOnEntry = false,
    },
    {
      name = "Attach to process (code-LLDB)",
      type = "lldb",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
  }
  dap.configurations.cpp = dap.configurations.c
  dap.configurations.rust = dap.configurations.c
end

return NvimDap
