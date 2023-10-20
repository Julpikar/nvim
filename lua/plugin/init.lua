local Plugin = {}

function Plugin.setup()
  local keymap_set = vim.keymap.set

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
      branch = "0.1.x",
      event = "VeryLazy",
      config = function()
        keymap_set("n", "<LEADER>o", "<CMD>Telescope oldfiles<CR>")
      end,
    },
    "nvim-treesitter/nvim-treesitter",
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

    -- Session
    {
      "stevearc/resession.nvim",
      config = function()
        require("plugin.resession").config()
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
        keymap_set("n", "<LEADER>p", require("telescope").extensions.projects.projects)
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
      "RRethy/vim-illuminate",
      config = function()
        require("illuminate").configure({ modes_denylist = { "v", "vs", "V", "Vs", "CTRL_V", "CTRL_Vs" } })
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
      "willothy/nvim-cokeline",
      config = function()
        require("plugin.nvim-cokeline").config()
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
        "hrsh7th/cmp-cmdline",
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
      event = "VeryLazy",
      config = function()
        keymap_set("n", "<leader>xx", function()
          require("trouble").open()
        end)
        keymap_set("n", "<leader>xw", function()
          require("trouble").open("workspace_diagnostics")
        end)
        keymap_set("n", "<leader>xd", function()
          require("trouble").open("document_diagnostics")
        end)
        keymap_set("n", "<leader>xq", function()
          require("trouble").open("quickfix")
        end)
        keymap_set("n", "<leader>xl", function()
          require("trouble").open("loclist")
        end)
        keymap_set("n", "gR", function()
          require("trouble").open("lsp_references")
        end)
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
    },
    {
      "rmagatti/goto-preview",
      event = "VeryLazy",
      config = function()
        require("goto-preview").setup()
        keymap_set({ "v", "n" }, "gd", require("goto-preview").goto_preview_definition)
        keymap_set({ "v", "n" }, "gt", require("goto-preview").goto_preview_type_definition)
        keymap_set({ "v", "n" }, "gi", require("goto-preview").goto_preview_implementation)
        keymap_set({ "v", "n" }, "gx", require("goto-preview").close_all_win)
        keymap_set({ "v", "n" }, "gr", require("goto-preview").goto_preview_references)
      end,
    },
    {
      "Wansmer/symbol-usage.nvim",
      event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
      config = function()
        require("symbol-usage").setup()
      end,
    },
    { "rcarriga/nvim-notify", event = "VeryLazy" },

    -- Editing Support
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end,
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
    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    },
    {
      "stevearc/conform.nvim",
      config = function()
        require("plugin.conform").config()
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      config = function()
        require("ibl").setup()
      end,
    },

    -- Programming Language Support
    -- CMake
    {
      "Civitasv/cmake-tools.nvim",
      event = "VeryLazy",
      config = function()
        require("cmake-tools").setup({
          cmake_soft_link_compile_commands = false,
          cmake_compile_commands_from_lsp = true,
          cmake_build_directory = "out\\${variant:buildType}",
        })
        keymap_set("n", "<LEADER>cg", "<CMD>CMakeGenerate<CR>")
        keymap_set("n", "<LEADER>cb", "<CMD>CMakeBuild<CR>")
        keymap_set("n", "<LEADER>cr", "<CMD>CMakeRun<CR>")
      end,
    },
  })
end

return Plugin
