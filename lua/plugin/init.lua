local Plugin = {}

function Plugin.setup()
  local keymap_set = vim.keymap.set

  local config = {
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
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup({

          highlight = {
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            -- disable = { "c", "rust" },
            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            disable = function(lang, buf)
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                return true
              end
            end,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
        })
      end,
    },
    "HiPhish/rainbow-delimiters.nvim",
    {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("plugin.toggleterm").config()
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
      event = "VeryLazy",
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
      event = "VeryLazy",
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
    {
      "stevearc/aerial.nvim",
      event = "VeryLazy",
      config = function()
        require("aerial").setup({
          backends = { "treesitter" },
          layout = {
            min_width = 30,
          },
          -- optionally use on_attach to set keymaps when aerial has attached to a buffer
          on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            keymap_set("n", "{", "<CMD>AerialPrev<CR>")
            keymap_set("n", "}", "<CMD>AerialNext<CR>")
          end,
          show_guides = true,

          -- Customize the characters used when show_guides = true
          guides = {
            -- When the child item has a sibling below it
            mid_item = "├─",
            -- When the child item is the last in the list
            last_item = "└─",
            -- When there are nested child guides to the right
            nested_top = "│ ",
            -- Raw indentation
            whitespace = "  ",
          },
        })
        -- You probably also want to set a keymap to toggle aerial
        keymap_set("n", "<LEADER>as", "<CMD>AerialToggle!<CR>")
        keymap_set("n", "<LEADER>af", function()
          require("telescope").extensions.aerial.aerial()
        end)
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
        keymap_set("n", "<LEADER>xx", require("trouble").open)
        keymap_set("n", "<LEADER>xw", function()
          require("trouble").open("workspace_diagnostics")
        end)
        keymap_set("n", "<LEADER>xd", function()
          require("trouble").open("document_diagnostics")
        end)
        keymap_set("n", "<LEADER>xq", function()
          require("trouble").open("quickfix")
        end)
        keymap_set("n", "<LEADER>xl", function()
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
        require("plugin.symbol-usage").config()
      end,
    },
    {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify")
      end,
    },

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
      event = "VeryLazy",
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
      event = "VeryLazy",
      config = function()
        require("Comment").setup()
      end,
    },
    {
      "stevearc/conform.nvim",
      event = "VeryLazy",
      config = function()
        require("plugin.conform").config()
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = "VeryLazy",
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
          cmake_build_directory = "out\\${variant:buildType}",
        })
        keymap_set("n", "<LEADER>cg", "<CMD>CMakeGenerate<CR>")
        keymap_set("n", "<LEADER>cb", "<CMD>CMakeBuild<CR>")
        keymap_set("n", "<LEADER>cr", "<CMD>CMakeRun<CR>")
      end,
    },
    -- Rust
    {
      "mrcjkb/rustaceanvim",
      version = "^3", -- Recommended
      ft = { "rust" },
      config = function()
        require("plugin.rustaceanvim").config()
      end,
    },
  }

  require("lazy").setup(config)
end

return Plugin
