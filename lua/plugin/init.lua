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
    { "HiPhish/rainbow-delimiters.nvim" },
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
    { "lewis6991/gitsigns.nvim", event = "BufEnter", config = true },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "sindrets/diffview.nvim",
      },
      opts = {
        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          item = { "󰧂", "󰦿" },
          section = { "󰧂", "󰦿" },
        },
      },
      keys = { { "<LEADER>gn", "<CMD>Neogit<CR>" } },
    },

    -- Navigation
    { "lewis6991/satellite.nvim", config = true },
    {
      "hedyhli/outline.nvim",
      config = true,
      keys = { -- Example mapping to toggle outline
        { "<F10>", "<cmd>Outline<CR>", desc = "Toggle outline" },
      },
    },
    {
      "RRethy/vim-illuminate",
      event = "VeryLazy",
      config = function()
        require("illuminate").configure({
          filetypes_denylist = { "NvimTree" },
          modes_denylist = { "v", "vs", "V", "Vs", "CTRL_V", "CTRL_Vs" },
          should_enable = function(bufnr)
            return vim.api.nvim_buf_line_count(bufnr) < 500
          end,
        })
      end,
    },
    { import = "plugin.flash" },
    { import = "plugin.nvim-cokeline" },
    { import = "plugin.lualine" },

    -- LSP Integration
    { import = "plugin.nvim-cmp" },
    { import = "plugin.nvim-lspconfig" },
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {
        hint_prefix = {
          above = "↙ ", -- when the hint is on the line above the current line
          current = "← ", -- when the hint is on the same line
          below = "↖ ", -- when the hint is on the line below the current line
        },
      },
      config = function(_, opts)
        require("lsp_signature").setup(opts)
      end,
    },
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
    { "numToStr/Comment.nvim", event = "BufEnter", config = true },
    { import = "plugin.conform" },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = "VeryLazy",
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
    concurrency = 1,
    rocks = { enable = false },
  })
end

return Plugin
