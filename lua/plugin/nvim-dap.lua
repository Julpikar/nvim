local dap = require("dap")

local DAP = {}

local function adapter_definition()
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- CHANGE THIS to your path!
      command = "codelldb.cmd",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }
end

local function language_configuration()
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
  dapui_setup()
end

return DAP
