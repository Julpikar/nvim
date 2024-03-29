local dap = require("dap")

local DAP = {}

local function adapter_definition()
  dap.adapters.lldb = {
    type = "executable",
    command = "codelldb", -- adjust as needed, must be absolute path
    name = "lldb",
  }
end

local function language_configuration()
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},

      -- 💀
      -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
      --
      --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      --
      -- Otherwise you might get the following error:
      --
      --    Error on launch: Failed to attach to the target process
      --
      -- But you should be aware of the implications:
      -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
      runInTerminal = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

local function mappings()
  local keymap_set = vim.keymap.set
  keymap_set("n", "<F8>", dap.continue)
  keymap_set("n", "<F10>", dap.step_over)
  keymap_set("n", "<F11>", dap.step_into)
  keymap_set("n", "<F12>", dap.step_out)
  keymap_set("n", "<Leader>b", dap.toggle_breakpoint)
  keymap_set("n", "<Leader>B", dap.set_breakpoint)
  keymap_set("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end)
  keymap_set("n", "<Leader>dr", dap.repl.open)
  keymap_set("n", "<Leader>dl", dap.run_last)

  local dap_widgets = require("dap.ui.widgets")
  keymap_set({ "n", "v" }, "<Leader>dh", dap_widgets.hover)
  keymap_set({ "n", "v" }, "<Leader>dp", dap_widgets.preview)
  keymap_set("n", "<Leader>df", function()
    dap_widgets.centered_float(dap_widgets.frames)
  end)
  keymap_set("n", "<Leader>ds", function()
    dap_widgets.centered_float(dap_widgets.scopes)
  end)
end

local function dapui_setup()
  local dapui = require("dapui")
  dapui.setup()
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

function DAP.config()
  adapter_definition()
  language_configuration()
  mappings()
end

return DAP
