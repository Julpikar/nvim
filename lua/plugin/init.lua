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
    setup = function()
      require("plugin.truezen").keymap()
    end,
    config = function()
      require("plugin.truezen").config()
    end
  }
  use {
    "editorconfig/editorconfig-vim",
    event = "BufRead *",
    config = function()
      require("plugin.editorconfig").config()
    end
  }
  use {
    "mg979/vim-visual-multi",
    event = "CursorMoved *",
    setup = function()
      vim.g.VM_theme = "neon"
    end
  }
  use {
    "ntpeters/vim-better-whitespace",
    event = "BufRead *",
    config = function()
      require("plugin.whitespace").config()
    end
  }
  use {"farmergreg/vim-lastplace", event = "BufReadPost *"}
  use {
    "junegunn/vim-easy-align",
    cmd = {"EasyAlign"},
    setup = function()
      require("plugin.easyalign").keymap()
    end
  }

  -- Comment
  use {
    "b3nj5m1n/kommentary",
    event = "BufRead *",
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
    setup = function()
      require("plugin.nvim-tree").keymap()
    end,
    config = function()
      require("plugin.nvim-tree").config()
    end
  }
  use {
    "airblade/vim-rooter",
    event = "BufReadPre",
    config = function()
      require("plugin.vim-rooter").config()
    end
  }
  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    setup = function()
      require("plugin.vista").keymap()
    end
  }

  -- Navigation
  use {
    "phaazon/hop.nvim",
    cmd = {"HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWord"},
    config = function()
      require("hop").setup({create_hl_autocmd = false})
    end
  }
  use {
    "numToStr/Navigator.nvim",
    setup = function()
      require("plugin.navigator").keymap()
    end,
    config = function()
      require("plugin.navigator").config()
    end
  }
  use {
    "dstein64/nvim-scrollview",
    event = "BufReadPost *",
    config = function()
      vim.g.scrollview_excluded_filetypes = {
        "dashboard",
        "vista"
      }
      vim.g.scrollview_winblend = 10
    end
  }
  use {
    "famiu/bufdelete.nvim"
  }
  use {"matbme/JABS.nvim", cmd = {"JABSOpen"}}

  -- Line number
  use {
    "myusuf3/numbers.vim",
    event = "BufRead *",
    setup = function()
      local remap = vim.api.nvim_set_keymap
      local opts = {
        noremap = true
      }
      remap("n", "<F5>", ":NumbersToggle<CR>", opts)
      remap("n", "<F6>", ":NumbersOnOff<CR>", opts)
      vim.g.numbers_exclude = {"dashboard", "NvimTree", "packer", "telescope", "vista"}
    end
  }

  -- Keymap guide
  use {
    "folke/which-key.nvim",
    config = function()
      require("plugin.whichkey").config()
    end
  }

  -- Line
  use {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPost",
    config = function()
      require("plugin.bufferline").config()
    end
  }
  use {
    "glepnir/galaxyline.nvim",
    config = function()
      require("plugin.galaxyline").config()
    end
  }

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Git
  use {
    "TimUntersberger/neogit",
    cmd = {"Neogit"},
    requires = {{"nvim-lua/plenary.nvim"}, {"sindrets/diffview.nvim"}},
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
    event = "BufRead *",
    config = function()
      require("gitsigns").setup {keymaps = {}}
    end
  }

  -- Floating terminal
  use {
    "voldikss/vim-floaterm",
    cmd = {"FloatermNew", "FloatermToggle"},
    setup = function()
      require("plugin.floaterm").config()
    end
  }

  -- Formatter
  use {
    "mhartington/formatter.nvim",
    cmd = {"Format"},
    setup = function()
      require("plugin.format").keymap()
    end,
    config = function()
      require("plugin.format").config()
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter *",
    config = function()
      require("plugin.treesitter").config()
    end
  }
  use {
    "p00f/nvim-ts-rainbow",
    event = "BufEnter *",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  use {
    "windwp/nvim-ts-autotag",
    ft = {"blade", "html", "tsx", "vue", "svelte", "php"},
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
  use {
    "lewis6991/spellsitter.nvim",
    event = "BufRead *",
    config = function()
      require("spellsitter").setup {captures = {}}
    end
  }

  -- Syntax highlighting non treesitter
  use {"jwalton512/vim-blade", ft = "blade"}

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead *",
    config = function()
      require("colorizer").setup()
    end
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim"
    }
  }

  -- Session
  use {
    "rmagatti/session-lens",
    cmd = "SearchSession",
    requires = {
      "nvim-telescope/telescope.nvim",
      {
        "rmagatti/auto-session",
        config = function()
          require("auto-session").setup {
            auto_restore_enabled = false,
            auto_session_enable_last_session = false
          }
        end
      }
    },
    config = function()
      require("session-lens").setup()
    end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    event = "BufReadPost *",
    config = function()
      require("plugin.lspconfig").config()
    end
  }
  use "nvim-lua/lsp-status.nvim"
  use {
    "glepnir/lspsaga.nvim",
    cmd = {"Lspsaga"},
    setup = function()
      require("plugin.lspsaga").keymap()
    end,
    config = function()
      require("plugin.lspsaga").config()
    end
  }
  use {
    "onsails/lspkind-nvim",
    event = "InsertEnter *",
    config = function()
      require("plugin.lspkind").config()
    end
  }
  use {
    "kosayoda/nvim-lightbulb",
    event = "BufReadPost *",
    config = function()
      require("plugin.lightbulb").config()
    end
  }
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("plugin.trouble").config()
    end
  }
  use {"ray-x/lsp_signature.nvim", event = "InsertEnter *"}

  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    event = "BufReadPost *",
    requires = {
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets"
    },
    setup = function()
      require("plugin.compe").keymap()
    end,
    config = function()
      require("plugin.compe").config()
    end
  }

  -- AutoPair
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter *",
    requires = {"nvim-compe", "nvim-treesitter"},
    config = function()
      require("plugin.autopairs").config()
    end
  }

  -- External Linter
  use {
    "mfussenegger/nvim-lint",
    disable = true,
    event = "BufRead *",
    setup = function()
      require("plugin.nvim-lint").keymap()
    end,
    config = function()
      require("plugin.nvim-lint").config()
    end
  }

  -- Interacting with databases
  use {
    "kristijanhusak/vim-dadbod-ui",
    cmd = {"DBUIToggle"},
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion"
    },
    setup = function()
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
    end
  }

  -- Debugger
  use {
    "rcarriga/nvim-dap-ui",
    cmd = "DapContinue",
    requires = {
      {
        "mfussenegger/nvim-dap",
        setup = function()
          require("plugin.nvim-dap").command()
        end,
        config = function()
          require("plugin.nvim-dap").config()
        end
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          vim.g.dap_virtual_text = true
        end
      }
    },
    config = function()
      require("dapui").setup()
    end
  }
  use {
    "nvim-telescope/telescope-dap.nvim",
    cmd = "DapContinue",
    config = function()
      require("telescope").load_extension("dap")
    end
  }

  -- Lua Debugger
  use {
    "jbyuki/one-small-step-for-vimkind",
    cmd = "DapContinue",
    ft = "lua"
  }

  -- Golang
  use {
    "crispgm/nvim-go",
    ft = "go",
    config = function()
      require("plugin.nvim-go").config()
    end
  }

  -- Rust
  use {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require("rust-tools").setup {
        server = {
          autostart = false
        }
      }
    end
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
          return require("packer.util").float {border = "single"}
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
