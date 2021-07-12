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
    event = "BufRead",
    config = function()
      require("plugin.truezen").config()
    end
  }
  use {
    "mg979/vim-visual-multi",
    event = "InsertEnter",
    setup = function()
      vim.g.VM_theme = "neon"
    end
  }
  use {
    "ntpeters/vim-better-whitespace",
    event = "BufRead",
    config = function()
      require("plugin.whitespace").config()
    end
  }
  use {"farmergreg/vim-lastplace"}
  use {
    "junegunn/vim-easy-align",
    event = "BufRead",
    config = function()
      require("plugin.easyalign").config()
    end
  }
  use {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
  use {
    "lewis6991/spellsitter.nvim",
    config = function()
      require("spellsitter").setup {captures = {}}
    end
  }

  -- Comment
  use {
    "b3nj5m1n/kommentary",
    event = "BufRead",
    setup = function()
      vim.g.kommentary_create_default_mappings = false
    end,
    config = function()
      local remap = vim.api.nvim_set_keymap
      remap("v", "<leader>ci", "<Plug>kommentary_visual_increase", {})
      remap("v", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
    end
  }

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    config = function()
      require("plugin.dashboard").config()
    end
  }

  -- Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugin.tree").config()
    end
  }
  use {
    "airblade/vim-rooter",
    config = function()
      require("plugin.vim-rooter").config()
    end
  }
  use {
    "liuchengxu/vista.vim",
    config = function()
      require("plugin.vista").config()
    end
  }

  -- Navigation
  use {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup({create_hl_autocmd = false})
    end
  }
  use {
    "numToStr/Navigator.nvim",
    config = function()
      require("plugin.navigator").config()
    end
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
  use "famiu/bufdelete.nvim"
  use "matbme/JABS.nvim"

  -- Session
  use {
    "rmagatti/auto-session",
    requires = {
      "rmagatti/session-lens",
      config = function()
        require("session-lens").setup()
      end
    },
    config = function()
      require("auto-session").setup(
        {
          auto_restore_enabled = false,
          auto_session_enable_last_session = false
        }
      )
    end
  }

  -- Line number
  use {
    "myusuf3/numbers.vim",
    setup = function()
      vim.g.numbers_exclude = {"dashboard", "NvimTree", "packer", "telescope", "vista"}
    end,
    config = function()
      local remap = vim.api.nvim_set_keymap
      local opts = {
        noremap = true
      }
      remap("n", "<F5>", ":NumbersToggle<CR>", opts)
      remap("n", "<F6>", ":NumbersOnOff<CR>", opts)
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
    event = "BufRead",
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
    event = "BufRead",
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
    event = "BufRead",
    config = function()
      require("gitsigns").setup {keymaps = {}}
    end
  }

  -- Floating terminal
  use {
    "voldikss/vim-floaterm",
    config = function()
      require("plugin.floaterm").config()
    end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugin.lspconfig").config()
    end,
    requires = "nvim-lua/lsp-status.nvim"
  }
  use {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugin.lspsaga").config()
    end
  }
  use {
    "onsails/lspkind-nvim",
    event = "BufRead",
    config = function()
      require("plugin.lspkind").config()
    end
  }
  use {
    "kosayoda/nvim-lightbulb",
    event = "BufRead",
    config = function()
      require("plugin.lightbulb").config()
    end
  }
  use {
    "folke/trouble.nvim",
    event = "BufRead",
    config = function()
      require("plugin.trouble").config()
    end
  }
  use "ray-x/lsp_signature.nvim"

  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    config = function()
      require("plugin.compe").config()
    end
  }
  use {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter",
    config = function()
      require("plugin.vsnip").config()
    end,
    requires = {"rafamadriz/friendly-snippets", event = "InsertEnter"}
  }

  -- AutoPair
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugin.autopairs").config()
    end
  }

  -- External Linter
  use {
    "mfussenegger/nvim-lint",
    disable = true,
    event = "BufRead",
    config = function()
      require("plugin.nvim-lint").config()
    end
  }

  -- Formatter
  use {
    "mhartington/formatter.nvim",
    config = function()
      require("plugin.format").config()
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = "p00f/nvim-ts-rainbow",
    config = function()
      require("plugin.treesitter").config()
    end
  }

  -- Syntax highlighting non treesitter
  use {"jwalton512/vim-blade", event = "BufRead", ft = "blade"}

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
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

  -- Interacting with databases
  use {
    "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-completion",
      {
        "kristijanhusak/vim-dadbod-ui",
        config = function()
          vim.g.db_ui_show_database_icon = 1
          vim.g.db_ui_use_nerd_fonts = 1
        end
      }
    }
  }

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    requires = {
      {
        "nvim-telescope/telescope-dap.nvim",
        event = "BufRead",
        config = function()
          require("telescope").load_extension("dap")
        end
      },
      {
        "rcarriga/nvim-dap-ui",
        event = "BufRead",
        config = function()
          require("dapui").setup()
        end
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        event = "BufRead",
        config = function()
          vim.g.dap_virtual_text = true
        end
      },
      -- Lua Debugger
      {
        "jbyuki/one-small-step-for-vimkind",
        event = "BufRead"
      }
    },
    config = function()
      require("plugin.nvim-dap").config()
    end
  }

  -- CMake
  use {"ilyachur/cmake4vim", event = "BufRead", ft = "cmake"}

  -- Golang
  use {
    "crispgm/nvim-go",
    event = "BufRead",
    ft = "go",
    config = function()
      require("plugin.nvim-go").config()
    end
  }

  -- Rust
  use {
    "simrat39/rust-tools.nvim",
    event = "BufRead",
    ft = "rust",
    config = function()
      require("rust-tools").setup()
    end
  }
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
