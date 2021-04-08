local packer = require("packer")

local Plugin_manager = {}

local function plugin_init(use)
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use {"sainnhe/gruvbox-material", config = require("plugin.colorscheme").config()}

  -- Editing
  use "mg979/vim-visual-multi"
  use {"ntpeters/vim-better-whitespace", config = require("plugin.whitespace").config()}
  use "farmergreg/vim-lastplace"
  use {"junegunn/vim-easy-align", config = require("plugin.easyalign").config()}
  use {"Raimondi/delimitMate", config = require("plugin.delimitmate").config()}

  -- Dashboard
  use {"glepnir/dashboard-nvim", config = require("plugin.dashboard").config()}

  -- Explorer
  use {"kyazdani42/nvim-tree.lua", config = require("plugin.tree").config()}
  use {"airblade/vim-rooter", config = require("plugin.vim-rooter").config()}
  use {"liuchengxu/vista.vim", config = require("plugin.vista").config()}

  -- Keymap guide
  use {"liuchengxu/vim-which-key", config = vim.cmd("source " .. vim.fn.stdpath("config") .. "/viml/whichkey/init.vim")}

  -- Line
  use {"akinsho/nvim-bufferline.lua", config = require("plugin.bufferline").config()}
  use {"glepnir/galaxyline.nvim", config = require("plugin.galaxyline").config()}

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Git
  use "tpope/vim-fugitive"
  use {"lewis6991/gitsigns.nvim", config = require("gitsigns").setup()}

  -- Floating terminal
  use {"voldikss/vim-floaterm", config = require("plugin.floaterm").config()}

  -- LSP
  use {"neovim/nvim-lspconfig", config = require("plugin.lspconfig").config()}
  use {"glepnir/lspsaga.nvim", config = require("plugin.lspsaga").config()}
  use {"onsails/lspkind-nvim", config = require("plugin.lspkind").config()}
  use {"kosayoda/nvim-lightbulb", config = require("plugin.lightbulb").config()}

  -- Autocomplete
  use {"hrsh7th/nvim-compe", config = require("plugin.compe").config()}
  use {"hrsh7th/vim-vsnip", config = require("plugin.vsnip").config()}

  -- Formatter
  use {"mhartington/formatter.nvim", config = require("plugin.format").config()}

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = "p00f/nvim-ts-rainbow",
    config = require("plugin.treesitter").config()
  }

  -- Colorizer
  use {"norcalli/nvim-colorizer.lua", config = "require 'colorizer'.setup()"}

  -- Telescope
  use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}}

  -- Lua REPL
  use "rafcamlet/nvim-luapad"
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
