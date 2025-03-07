local NvimDap = {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "jay-babu/mason-nvim-dap.nvim", config = true },
    { "theHamsta/nvim-dap-virtual-text", opts = { commented = true } },
  },
  cmd = { "DapNew", "DapContinue" },
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
    "<Leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
  },
  {
    "<Leader>dB",
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

return NvimDap
