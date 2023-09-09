local Plugin = {}

function Plugin.setup()
  require("lazy").setup({
    {
      "oxfist/night-owl.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd.colorscheme("night-owl")
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
    {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    },
    {
      "voldikss/vim-floaterm",
      event = "VeryLazy",
      config = function()
        require("plugin.vim-floaterm").config()
      end,
    },

    -- Startup
    {
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("plugin.alpha-nvim").config()
      end,
    },

    -- Project
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({
          detection_methods = { "pattern", "lsp" },
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "CMakeLists.txt" },
        })
        require("telescope").load_extension("projects")
        vim.api.nvim_set_keymap(
          "n",
          "<LEADER>p",
          "<CMD>lua require('telescope').extensions.projects.projects{}<CR>",
          { buffer = bufnr, noremap = true, silent = true, nowait = true }
        )
      end,
    },

    -- File Manager
    {
      "nvim-tree/nvim-tree.lua",
      event = "VeryLazy",
      config = function()
        require("plugin.nvim-tree-lua").config()
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
    {
      "lewis6991/satellite.nvim",
      config = function()
        require("satellite").setup({
          excluded_filetypes = { "cmake_tools_terminal" },
        })
      end,
    },
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
      "nvim-lualine/lualine.nvim",
      config = function()
        require("plugin.lualine").config()
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
      dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("plugin.nvim-lspconfig").config()
      end,
    },
    {
      "folke/trouble.nvim",
      config = function()
        vim.keymap.set("n", "<leader>xx", function()
          require("trouble").open()
        end)
        vim.keymap.set("n", "<leader>xw", function()
          require("trouble").open("workspace_diagnostics")
        end)
        vim.keymap.set("n", "<leader>xd", function()
          require("trouble").open("document_diagnostics")
        end)
        vim.keymap.set("n", "<leader>xq", function()
          require("trouble").open("quickfix")
        end)
        vim.keymap.set("n", "<leader>xl", function()
          require("trouble").open("loclist")
        end)
        vim.keymap.set("n", "gR", function()
          require("trouble").open("lsp_references")
        end)
      end,
    },
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
    {
      "Civitasv/cmake-tools.nvim",
      config = function()
        require("cmake-tools").setup({
          cmake_build_directory_prefix = "",
          cmake_soft_link_compile_commands = false,
        })
      end,
    },
  })
end

return Plugin
