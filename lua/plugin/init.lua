local packer = require("packer")

local Plugin_manager = {}

local function plugin_init(use)
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use {
    "sainnhe/gruvbox-material",
    disable = false,
    setup = function()
      local g = vim.g
      g.gruvbox_material_palette = "material"
      g.gruvbox_material_background = "hard"
      g.gruvbox_material_enable_bold = true
      g.gruvbox_material_enable_italic = true
      g.gruvbox_material_cursor = "green"
    end,
    config = function()
      --vim.cmd [[colorscheme gruvbox-material]]
    end
  }
  use {
    "arcticicestudio/nord-vim",
    config = function()
      --vim.cmd [[colorscheme nord]]
    end
  }
  use {
    "glepnir/oceanic-material",
    setup = function()
      -- ocean: #1b2b34 medium: #282C34 deep:#212112 darker:#1d1f21
      --vim.g.oceanic_material_background = "medium"
      vim.g.oceanic_material_allow_bold = true
      vim.g.oceanic_material_allow_italic = true
      vim.g.oceanic_material_allow_underline = true
      vim.g.oceanic_material_allow_undercurl = true
    end,
    config = function()
      --vim.cmd [[colorscheme oceanic_material]]
    end
  }
  use "sainnhe/sonokai"
  use {
    "bluz71/vim-nightfly-guicolors",
    setup = function()
      vim.g.nightflyCursorColor = true
      vim.g.nightflyUnderlineMatchParen = true
    end,
    config = function()
      vim.cmd [[colorscheme nightfly]]
    end
  }

  -- Editing
  use "mg979/vim-visual-multi"
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

  -- Vim graphical debugger
  use {"puremourning/vimspector", disable = true}

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
