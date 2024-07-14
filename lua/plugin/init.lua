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
    "HiPhish/rainbow-delimiters.nvim",
    {
      "NvChad/nvim-colorizer.lua",
      config = true,
    },
    { import = "plugin.toggleterm" },
    { import = "plugin.fidget" },

    -- External Tool Manager
    {
      "williamboman/mason.nvim",
      config = true,
    },
    { "williamboman/mason-lspconfig.nvim", config = true },
    { "rshkarin/mason-nvim-lint", config = true },
    { "jay-babu/mason-nvim-dap.nvim", config = true },

    -- Session
    { import = "plugin.resession" },

    -- File Manager
    { import = "plugin.nvim-tree" },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Git Integration
    {
      "lewis6991/gitsigns.nvim",
      event = "VeryLazy",
      config = true,
    },
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
    {
      "lewis6991/satellite.nvim",
      config = true,
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
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { import = "plugin.nvim-lspconfig" },
    {
      "ray-x/lsp_signature.nvim",
      lazy = true,
      config = true,
    },
    {
      "rmagatti/goto-preview",
      event = "VeryLazy",
      config = true,
      keys = {
        { "gd", "require('goto-preview').goto_preview_definition" },
        { "gt", "require('goto-preview').goto_preview_type_definition" },
        { "gi", "require('goto-preview').goto_preview_implementation" },
        { "gx", "require('goto-preview').close_all_win" },
        { "gr", "require('goto-preview').goto_preview_references" },
      },
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
    {
      "emileferreira/nvim-strict",
      event = "VeryLazy",
      opts = {
        excluded_filetypes = {
          "help",
          "html",
          "make",
          "markdown",
          "nofile",
          "prompt",
          "terminal",
          "text",
        },
        deep_nesting = {
          depth_limit = 5,
          ignored_trailing_characters = ",",
          ignored_leading_characters = ".",
        },
        overlong_lines = {
          length_limit = 80,
        },
      },
    },
    {
      "numToStr/Comment.nvim",
      event = "VeryLazy",
      config = true,
    },
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
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      event = "VeryLazy",
      opts = { commented = true },
    },

    -- Linter
    { import = "plugin.nvim-lint" },

    -- Programming Language Support
    -- CMake
    { "Civitasv/cmake-tools.nvim", config = true },

    -- Golang
    { import = "plugin.gonvim" },

    -- Rust
    { import = "plugin.rustaceanvim" },

    -- SQL
    { "nanotee/sqls.nvim", ft = { "sql" } },
  }

  require("lazy").setup({
    spec = spec,
    checker = { concurrency = 1 },
  })
end

return Plugin
