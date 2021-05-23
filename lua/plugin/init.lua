local packer = require("packer")

local Plugin_manager = {}

local function load_config(path)
  local plugin = require(path)
  if not pcall(plugin.config()) then
    print("plugin " .. path .. " not work")
  end
end

local function plugin_init(use)
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use {
    "sainnhe/sonokai",
    setup = function()
      local g = vim.g
      g.sonokai_style = "default"
      g.sonokai_enable_italic = 1
    end,
    config = function()
      vim.cmd [[colorscheme sonokai]]
    end
  }

  -- Editing
  use {
    "mg979/vim-visual-multi",
    setup = function()
      vim.g.VM_theme = "neon"
    end
  }
  use {
    "ntpeters/vim-better-whitespace",
    config = function()
      load_config("plugin.whitespace")
    end
  }
  use "farmergreg/vim-lastplace"
  use {
    "junegunn/vim-easy-align",
    config = function()
      load_config("plugin.easyalign")
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      load_config("plugin.autopairs")
    end
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }

  -- Comment
  use {
    "b3nj5m1n/kommentary",
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
      load_config("plugin.dashboard")
    end
  }

  -- Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      load_config("plugin.tree")
    end
  }
  use {
    "airblade/vim-rooter",
    config = function()
      load_config("plugin.vim-rooter")
    end
  }
  use {
    "liuchengxu/vista.vim",
    config = function()
      load_config("plugin.vista")
    end
  }

  -- Navigation
  use "phaazon/hop.nvim"
  use {
    "numToStr/Navigator.nvim",
    config = function()
      load_config("plugin.navigator")
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

  -- Session
  use {
    "Julpikar/auto-session",
    requires = {
      "Julpikar/session-lens",
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
      load_config("plugin.whichkey")
    end
  }

  -- Line
  use {
    "akinsho/nvim-bufferline.lua",
    config = function()
      load_config("plugin.bufferline")
    end
  }
  use {
    "glepnir/galaxyline.nvim",
    config = function()
      load_config("plugin.galaxyline")
    end
  }

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Git
  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {keymaps = {}}
    end
  }

  -- Floating terminal
  use {
    "voldikss/vim-floaterm",
    config = function()
      load_config("plugin.floaterm")
    end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      load_config("plugin.lspconfig")
    end,
    requires = "nvim-lua/lsp-status.nvim"
  }
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      load_config("plugin.lspsaga")
    end
  }
  use {
    "onsails/lspkind-nvim",
    config = function()
      load_config("plugin.lspkind")
    end
  }
  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      load_config("plugin.lightbulb")
    end
  }
  use {
    "folke/trouble.nvim",
    config = function()
      load_config("plugin.trouble")
    end
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    config = function()
      load_config("plugin.compe")
    end
  }
  use {
    "hrsh7th/vim-vsnip",
    config = function()
      load_config("plugin.vsnip")
    end,
    requires = "rafamadriz/friendly-snippets"
  }

  -- External Linter
  use {
    "mfussenegger/nvim-lint",
    disable = true,
    config = function()
      load_config("plugin.nvim-lint")
    end
  }

  -- Formatter
  use {
    "mhartington/formatter.nvim",
    config = function()
      load_config("plugin.format")
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = "p00f/nvim-ts-rainbow",
    config = function()
      load_config("plugin.treesitter")
    end
  }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
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
      "kristijanhusak/vim-dadbod-ui"
    }
  }

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    requires = {
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require("telescope").load_extension("dap")
        end
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
        end
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          vim.g.dap_virtual_text = true
        end
      },
      -- Lua Debugger
      {
        "jbyuki/one-small-step-for-vimkind"
      }
    },
    config = function()
      load_config("plugin.nvim-dap")
    end
  }

  -- Golang
  use {
    "crispgm/nvim-go",
    ft = "go",
    config = function()
      load_config("plugin.nvim-go")
    end
  }
end

function Plugin_manager.load_plugins()
  packer.init({max_jobs = 4})
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
