local Plugin = {}

function Plugin.setup()
  require("lazy").setup({
    {
      -- colorscheme
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "latte",
        })
        vim.cmd("colorscheme catppuccin")
        vim.cmd("highlight Cursor cterm=bold gui=bold guibg=#FFB06B guifg=black")
        vim.cmd("highlight Cursor2 guifg=red guibg=red")
        vim.o.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20"
      end,
    },

    -- Essential Tool
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.2",
      event = "VeryLazy",
      config = function()
        vim.api.nvim_set_keymap("n", "<LEADER>o", "<CMD>Telescope oldfiles<CR>", {})
      end,
    },
    { "nvim-treesitter/nvim-treesitter", lazy = true },
    "HiPhish/rainbow-delimiters.nvim",
    "NvChad/nvim-colorizer.lua",
    {
      "voldikss/vim-floaterm",
      event = "VeryLazy",
      config = function()
        require("plugin.vim-floaterm").config()
      end,
    },

    -- Project
    {
      "airblade/vim-rooter",
      config = function()
        vim.g.rooter_patterns = { ".git", "Makefile", "*.sln", "build/env.sh" }
        vim.g.rooter_change_directory_for_non_project_files = "current"
      end,
    },

    -- File Manager
    {
      "nvim-tree/nvim-tree.lua",
      event = "VeryLazy",
      config = function()
        require("plugin.nvim-tree").config()
      end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Git Integration
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
    },

    -- Navigation
    "lewis6991/satellite.nvim",
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = { excluded_filetypes = { "qf" } },
      keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "S",
          mode = { "n", "o", "x" },
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
        },
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash",
        },
        {
          "R",
          mode = { "o", "x" },
          function()
            require("flash").treesitter_search()
          end,
          desc = "Treesitter Search",
        },
        {
          "<c-s>",
          mode = { "c" },
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search",
        },
      },
    },
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("plugin.bufferline").config()
      end,
    },
    {
      "NTBBloodbath/galaxyline.nvim",
      config = function()
        require("plugin.galaxyline").config()
      end,
    },

    -- LSP Integration
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
      },
      config = function()
        require("plugin.nvim-cmp").config()
      end,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require("plugin.nvim-lspconfig").config()
      end,
    },
    { "folke/trouble.nvim", lazy = true },
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      event = "LspAttach",
      opts = { text = { spinner = "moon" } },
    },

    -- Editing Support
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("plugin.nvim-autopairs").config()
      end,
    },
    {
      "emileferreira/nvim-strict",
      config = function()
        require("strict").setup({
          excluded_filetypes = { "text", "markdown", "html" },
          deep_nesting = {
            depth_limit = 5,
            ignored_trailing_characters = ",",
            ignored_leading_characters = ".",
          },
          overlong_lines = {
            length_limit = 120,
          },
        })
      end,
    },
    "numToStr/Comment.nvim",
    {
      "mhartington/formatter.nvim",
      config = function()
        require("plugin.formatter").config()
        vim.api.nvim_set_keymap("n", "<F9>", "<CMD>Format<CR>", {})
      end,
    },

    -- Programming Language Support
    -- Golang
    {
      "ray-x/go.nvim",
      dependencies = { -- optional packages
        "ray-x/guihua.lua",
      },
      config = function()
        require("go").setup()
      end,
      event = { "CmdlineEnter" },
      ft = { "go", "gomod" },
    },
    -- CMake
    "ilyachur/cmake4vim",
  })
end

return Plugin
