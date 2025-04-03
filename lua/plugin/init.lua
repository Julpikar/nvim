local Plugin = {}

function Plugin.setup()
  local spec = {
    -- Essential Tool
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      event = "VeryLazy",
      keys = {
        { "<LEADER>o", "<CMD>Telescope oldfiles<CR>" },
        { "<LEADER>t", "<CMD>Telescope<CR>", desc = "Open Telescope" },
      },
    },
    { import = "plugin.treesitter" },
    { import = "plugin.rainbow-delimiters" },
    { "NvChad/nvim-colorizer.lua", config = true },
    { import = "plugin.toggleterm" },
    { import = "plugin.fidget" },

    -- External Tool Manager
    { "williamboman/mason.nvim", config = true, cmd = "Mason" },

    -- Session
    { import = "plugin.resession" },

    -- File Manager
    { import = "plugin.nvim-tree" },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Git Integration
    { import = "plugin.gitsign" },
    { import = "plugin.neogit" },

    -- Navigation
    {
      "lewis6991/satellite.nvim",
      init = function()
        vim.api.nvim_set_hl(0, "SatelliteBar", { bg = "#859289" })
      end,
      config = true,
    },
    {
      "hedyhli/outline.nvim",
      config = true,
      keys = { -- Example mapping to toggle outline
        { "<F10>", "<cmd>Outline<CR>", desc = "Toggle outline" },
      },
    },
    { import = "plugin.flash" },
    { import = "plugin.nvim-cokeline" },
    { import = "plugin.lualine" },

    -- LSP Integration
    { import = "plugin.blink" },
    { import = "plugin.symbol-usage" },

    -- Diagnostic
    { import = "plugin.trouble" },

    -- Editing Support
    {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = true,
    },
    { import = "plugin.nvim-autopairs" },
    { import = "plugin.conform" },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = "VeryLazy",
      init = function()
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, "IblIndent", { fg = "#495156", nocombine = true })
        set_hl(0, "IblScope", { fg = "#859289", nocombine = true })
      end,
      config = true,
    },

    -- Debugger
    { import = "plugin.nvim-dap" },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        local dap = require("dap")
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
      end,
      cmd = { "DapNew", "DapContinue" },
    },

    -- Task runner
    { "stevearc/overseer.nvim", event = "VeryLazy", config = true },

    -- Linter
    { import = "plugin.nvim-lint" },

    -- Testing
    { import = "plugin.neotest" },

    -- Programming Language Support
    -- CMake
    { "Civitasv/cmake-tools.nvim", ft = { "cmake" }, config = true },

    -- Golang
    { import = "plugin.gonvim" },

    -- SQL
    { "nanotee/sqls.nvim", ft = { "sql" } },
  }

  require("lazy").setup({
    spec = spec,
    concurrency = 4,
    rocks = { enable = false },
  })
end

return Plugin
