local packer = require("packer")

local Plugin_manager = {}

local function plugin_init(use)
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use {
    "sainnhe/sonokai",
    setup = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_diagnostic_text_highlight = true
      vim.g.sonokai_diagnostic_virtual_text = "colored"
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
      require("plugin.whitespace").config()
    end
  }
  use "farmergreg/vim-lastplace"
  use {
    "junegunn/vim-easy-align",
    config = function()
      require("plugin.easyalign").config()
    end
  }
  use {
    "Raimondi/delimitMate",
    config = function()
      require("plugin.delimitmate").config()
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
  use "phaazon/hop.nvim"
  use {
    "numToStr/Navigator.nvim",
    config = function()
      require("plugin.navigator").config()
    end
  }
  use {
    "dstein64/nvim-scrollview",
    config = function()
      vim.g.scrollview_winblend = 10
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
      local opts = {noremap = true}
      remap("n", "<F5>", ":NumbersToggle<CR>", opts)
      remap("n", "<F6>", ":NumbersOnOff<CR>", opts)
    end
  }

  -- Keymap guide
  use {
    "liuchengxu/vim-which-key",
    config = function()
      vim.cmd("source " .. vim.fn.stdpath("config") .. "/viml/whichkey/init.vim")
    end
  }

  -- Line
  use {
    "akinsho/nvim-bufferline.lua",
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
    config = function()
      require("plugin.lspsaga").config()
    end
  }
  use {
    "onsails/lspkind-nvim",
    config = function()
      require("plugin.lspkind").config()
    end
  }
  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("plugin.lightbulb").config()
    end
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-compe",
    config = function()
      require("plugin.compe").config()
    end
  }
  use {
    "hrsh7th/vim-vsnip",
    config = function()
      require("plugin.vsnip").config()
    end,
    requires = "rafamadriz/friendly-snippets"
  }

  -- External Linter
  use {
    "mfussenegger/nvim-lint",
    disable = true,
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

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  }

  -- Telescope
  use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}}

  -- Interacting with databases
  use {"tpope/vim-dadbod", requires = {"kristijanhusak/vim-dadbod-completion", "kristijanhusak/vim-dadbod-ui"}}

  -- Debugger
  use {"mfussenegger/nvim-dap", disable = true}

  -- Lua REPL
  use "rafcamlet/nvim-luapad"

  -- Golang
  use {
    "crispgm/nvim-go",
    config = function()
      require("plugin.nvim-go").config()
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
