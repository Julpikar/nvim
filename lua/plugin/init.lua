local packer = require("packer")

local Plugin_manager = {}

local function plugin_init(use)
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use {
    "Julpikar/onedark.nvim",
    config = function()
      vim.g.onedark_style = "darker"
      require("onedark").setup()
    end
  }

  -- Editing
  use {
    "Pocco81/TrueZen.nvim",
    cmd = {"TZAtaraxis", "TZFocus", "TZMinimalist"},
    setup = [[require("plugin.truezen").keymap()]],
    config = [[require("plugin.truezen").config()]]
  }
  use {
    "editorconfig/editorconfig-vim",
    config = [[require("plugin.editorconfig").config()]]
  }
  use {
    "mg979/vim-visual-multi",
    keys = {{"n", "<C-Up>"}, {"n", "<C-Down>"}},
    setup = [[vim.g.VM_theme = "neon"]]
  }
  use {
    "ntpeters/vim-better-whitespace",
    config = [[require("plugin.whitespace").config()]]
  }
  use "farmergreg/vim-lastplace"
  use {
    "junegunn/vim-easy-align",
    cmd = "EasyAlign",
    setup = [[require("plugin.easyalign").keymap()]]
  }

  -- Comment
  use {
    "b3nj5m1n/kommentary",
    keys = {"n", "<leader>c"},
    setup = function()
      local remap = vim.api.nvim_set_keymap
      remap("v", "<leader>ci", "<Plug>kommentary_visual_increase", {})
      remap("v", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
      vim.g.kommentary_create_default_mappings = false
    end
  }

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    setup = function()
      local dashboard = require("plugin.dashboard")
      dashboard.keymap()
      dashboard.setup()
    end
  }

  -- Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFindFile"},
    setup = [[require("plugin.nvim-tree").keymap()]],
    config = [[require("plugin.nvim-tree").config()]]
  }
  use {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_patterns = {".git", "Makefile", "*.sln", "build/env.sh"}
      vim.g.rooter_change_directory_for_non_project_files = "current"
    end
  }
  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    setup = [[require("plugin.vista").keymap()]]
  }

  -- Navigation
  use {
    "phaazon/hop.nvim",
    cmd = {"HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWord"},
    config = [[require("hop").setup({create_hl_autocmd = false})]]
  }
  use {
    "numToStr/Navigator.nvim",
    setup = [[require("plugin.navigator").keymap()]],
    config = [[require("plugin.navigator").config()]]
  }
  use {
    "dstein64/nvim-scrollview",
    config = function()
      vim.g.scrollview_excluded_filetypes = {
        "dashboard",
        "vista"
      }
      vim.g.scrollview_winblend = 10
    end
  }
  use {
    "kazhala/close-buffers.nvim",
    cmd = {"BDelete", "BWipeout"},
    config = function()
      require("close_buffers").setup(
        {
          preserve_window_layout = {"this"},
          next_buffer_cmd = function(windows)
            require("bufferline").cycle(1)
            local bufnr = vim.api.nvim_get_current_buf()

            for _, window in ipairs(windows) do
              vim.api.nvim_win_set_buf(window, bufnr)
            end
          end
        }
      )
    end
  }
  use {"matbme/JABS.nvim", cmd = "JABSOpen"}

  -- Line number
  use {
    "myusuf3/numbers.vim",
    setup = function()
      local remap = vim.api.nvim_set_keymap
      local opts = {
        noremap = true
      }
      remap("n", "<F7>", ":NumbersToggle<CR>", opts)
      remap("n", "<F6>", ":NumbersOnOff<CR>", opts)
      vim.g.numbers_exclude = {"dashboard", "NvimTree", "packer", "telescope", "vista"}
    end
  }

  -- Keymap guide
  use {
    "folke/which-key.nvim",
    config = [[require("plugin.whichkey").config()]]
  }

  -- Line
  use {
    "akinsho/nvim-bufferline.lua",
    config = [[require("plugin.bufferline").config()]]
  }
  use {
    "glepnir/galaxyline.nvim",
    requires = "nvim-lua/lsp-status.nvim",
    config = [[require("plugin.galaxyline").config()]]
  }

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Git
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    requires = {{"sindrets/diffview.nvim", cmd = "Neogit"}},
    config = function()
      require("neogit").setup {
        integration = {
          diffview = true
        }
      }
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = [[require("gitsigns").setup {keymaps = {}}]]
  }

  -- Floating terminal
  use {
    "voldikss/vim-floaterm",
    cmd = {"FloatermNew", "FloatermToggle"},
    setup = [[require("plugin.floaterm").setup()]]
  }

  -- Formatter
  use {
    "mhartington/formatter.nvim",
    cmd = "Format",
    setup = [[require("plugin.format").keymap()]],
    config = [[require("plugin.format").config()]]
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = [[require("plugin.treesitter").config()]]
  }
  use "p00f/nvim-ts-rainbow"

  use {
    "windwp/nvim-ts-autotag",
    ft = {"blade", "html", "tsx", "vue", "svelte", "php"},
    config = [[require("nvim-ts-autotag").setup()]]
  }
  use {
    "lewis6991/spellsitter.nvim",
    config = [[require("spellsitter").setup {captures = {}}]]
  }

  -- Syntax highlighting non treesitter
  use {"jwalton512/vim-blade", ft = "blade"}

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    ft = {"css", "html", "javascript", "lua", "typescript"},
    config = [[require("colorizer").setup()]]
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim"
    }
  }

  -- Session
  use {
    "rmagatti/session-lens",
    cmd = "SearchSession",
    after = "auto-session",
    requires = {
      {
        "rmagatti/auto-session",
        cmd = "SearchSession",
        config = [[require("auto-session").setup {
            auto_restore_enabled = false,
            auto_session_enable_last_session = false
          }]]
      }
    },
    config = [[require("session-lens").setup()]]
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = "ray-x/lsp_signature.nvim",
    config = [[require("plugin.lspconfig").config()]]
  }
  use {"jose-elias-alvarez/null-ls.nvim"}
  use {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    setup = [[require("plugin.lspsaga").keymap()]],
    config = [[require("plugin.lspsaga").config()]]
  }
  use {
    "onsails/lspkind-nvim",
    cmd = {"LspStart", "LspStop", "LspRestart"},
    config = [[require("plugin.lspkind").config()]]
  }
  use {
    "kosayoda/nvim-lightbulb",
    cmd = {"LspStart", "LspStop", "LspRestart"},
    config = [[require("plugin.lightbulb").config()]]
  }
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = [[require("plugin.trouble").config()]]
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    requires = {
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets"
    },
    setup = [[require("plugin.compe").keymap()]],
    config = [[require("plugin.compe").config()]]
  }

  -- AutoPair
  use {
    "windwp/nvim-autopairs",
    after = "nvim-compe",
    config = [[require("plugin.autopairs").config()]]
  }

  -- External Linter
  use {
    "mfussenegger/nvim-lint",
    disable = true,
    cmd = {"LspStart", "LspStop", "LspRestart"},
    setup = [[require("plugin.nvim-lint").keymap()]],
    config = [[require("plugin.nvim-lint").config()]]
  }

  -- Interacting with databases
  use {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUIToggle",
    requires = {
      {"tpope/vim-dadbod", cmd = "DBUIToggle"},
      {
        "kristijanhusak/vim-dadbod-completion",
        cmd = "DBUIToggle"
      }
    },
    setup = function()
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
    end
  }

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    keys = "<F5>",
    requires = {
      {
        "theHamsta/nvim-dap-virtual-text",
        keys = "<F5>",
        config = [[vim.g.dap_virtual_text = true]]
      }
    },
    config = [[require("plugin.nvim-dap").config()]]
  }

  use {
    "rcarriga/nvim-dap-ui",
    keys = "<F5>",
    config = [[require("dapui").setup()]]
  }
  use {
    "nvim-telescope/telescope-dap.nvim",
    after = {"nvim-dap", "telescope.nvim"},
    config = [[require("telescope").load_extension("dap")]]
  }

  -- Lua Debugger
  use {
    "jbyuki/one-small-step-for-vimkind",
    keys = "<F5>",
    ft = "lua"
  }

  -- Golang
  use {
    "crispgm/nvim-go",
    ft = "go",
    config = [[require("plugin.nvim-go").config()]]
  }

  -- Rust
  use {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = [[require("rust-tools").setup {
        server = {
          autostart = false
        }
      }]]
  }

  -- CMake
  use {"ilyachur/cmake4vim", cmd = {"CMake", "CCMake"}}

  -- Lua Repl
  use {"rafcamlet/nvim-luapad", cmd = {"Luapad"}}
end

function Plugin_manager.load_plugins()
  packer.init(
    {
      max_jobs = 1,
      git = {clone_timeout = 300},
      display = {
        open_fn = function()
          return require("packer.util").float {border = "rounded"}
        end
      },
      profile = {
        enable = true,
        threshold = 1 -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
      }
    }
  )
  return packer.startup(plugin_init)
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Plugin_manager})
    return self
  end
}
setmetatable(Plugin_manager, metatable)

return Plugin_manager
