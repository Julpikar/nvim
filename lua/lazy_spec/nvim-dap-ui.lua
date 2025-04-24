local NvimDap = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    { "mfussenegger/nvim-dap" },
    "nvim-neotest/nvim-nio",
    { "jay-babu/mason-nvim-dap.nvim", opts = {} },
    { "theHamsta/nvim-dap-virtual-text", opts = { commented = true } },
  },
  opts = {},
}
NvimDap.config = function(_, opts)
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup(opts)

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
  end

  dap.adapters.lldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = "codelldb",
      args = { "--port", "${port}" },
      detached = vim.uv.os_uname().sysname ~= "Windows",
    },
  }

  dap.configurations.cpp = {
    name = "Debug",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.uv.cwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  }
end

NvimDap.keys = {
  {
    "<F5>",
    function()
      require("dap").continue()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Continue",
  },
  {
    "<F10>",
    function()
      require("dap").step_over()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Step Over",
  },
  {
    "<F11>",
    function()
      require("dap").step_into()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Step Into",
  },
  {
    "<F12>",
    function()
      require("dap").step_out()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Step Out",
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Toggle Breakpoint",
  },
  {
    "<leader>dB",
    function()
      vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
        if condition then
          require("dap").set_breakpoint(condition)
        end
      end)
    end,
    { noremap = true, silent = true },
    desc = "DAP: Set Conditional Breakpoint",
  },
  {
    "<leader>dp",
    function()
      vim.ui.input({ prompt = "Log point message: " }, function(msg)
        if msg then
          require("dap").set_breakpoint(nil, nil, msg)
        end
      end)
    end,
    { noremap = true, silent = true },
    desc = "DAP: Set Log Point",
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.open()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Open REPL",
  },
  {
    "<leader>ds",
    function()
      require("dap").terminate()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Stop",
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    { noremap = true, silent = true },
    desc = "DAP: Run Last",
  },
  {
    "<leader>du",
    function()
      require("dapui").toggle({})
    end,
    { noremap = true, silent = true },
    desc = "DapUI: Toggle",
  },
  {
    "<leader>de",
    mode = { "n", "v" },
    function()
      require("dapui").eval()
    end,
    { noremap = true, silent = true },
    desc = "DapUI: Eval",
  },
}

return NvimDap
