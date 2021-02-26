local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- Colorscheme
    use {"Julpikar/night-owl.nvim"}
    use {"Julpikar/nord-vim"}
    use {"sainnhe/gruvbox-material"}
    use {"Julpikar/oceanic-material"}

    -- Editing
    use {
      "editorconfig/editorconfig",
      setup = function()
        vim.g.EditorConfig_exclude_patterns = {
          "fugitive://.*",
          "scp://.*"
        }
      end
    }

    use {"junegunn/vim-easy-align"}
    use {"AndrewRadev/splitjoin.vim"}
    use {"cometsong/CommentFrame.vim"}
    use {"ntpeters/vim-better-whitespace"} -- whitespace
    use {"farmergreg/vim-lastplace"} -- "reopen files at your last edit position
    use {"mg979/vim-visual-multi", branch = "master"}
    use {"RRethy/vim-illuminate"}
    use {"Raimondi/delimitMate"}

    -- Focusing
    use {"junegunn/goyo.vim"}
    use {"junegunn/limelight.vim"}

    -- Color
    use {"norcalli/nvim-colorizer.lua"}
    use {"norcalli/nvim-terminal.lua"}

    -- Utilities
    use {"dstein64/vim-startuptime"}
    use {"ojroques/nvim-bufdel"}
    use {"akinsho/nvim-bufferline.lua"}
    use {"akinsho/nvim-toggleterm.lua"}
    use {"kyazdani42/nvim-web-devicons"}
    use {"ryanoasis/vim-devicons"}
    use {"cjrh/vim-conda"}
    use {
      "airblade/vim-rooter",
      setup = function()
        vim.g.rooter_pattern = {
          ".git/",
          "package.json",
          "Cargo.toml"
        }
      end
    }

    use {
      "glepnir/galaxyline.nvim",
      branch = "main"
    }
    use {"preservim/nerdcommenter"}
    use {
      "preservim/nerdtree",
      requires = {
        {"Xuyuanp/nerdtree-git-plugin"},
        {"tiagofumo/vim-nerdtree-syntax-highlight"}
      }
    }
    use {"glepnir/dashboard-nvim"}
    use {"liuchengxu/vista.vim"}
    use {
      "nvim-lua/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-vimspector.nvim"}
      }
    }
    use {"antoinemadec/FixCursorHold.nvim"}

    -- Debugger
    use {"puremourning/vimspector"}

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        {"p00f/nvim-ts-rainbow"},
        {"nvim-treesitter/nvim-treesitter-refactor"},
        {"nvim-treesitter/completion-treesitter"}
      }
    }

    -- Neovim Builtin LSP
    use {
      "neovim/nvim-lspconfig",
      requires = {
        {"nvim-lua/lsp_extensions.nvim"},
        {"nvim-lua/lsp-status.nvim"},
        {"hrsh7th/nvim-compe"},
        {"onsails/lspkind-nvim"},
        {"glepnir/lspsaga.nvim"}
      }
    }

    -- Formatter
    use {"mhartington/formatter.nvim"}

    -- Snippets
    use {"hrsh7th/vim-vsnip"}

    -- Git
    use {
      "tpope/vim-fugitive",
      requires = {
        {"tpope/vim-rhubarb"},
        {"sodapopcan/vim-twiggy"}
      }
    }
    use {"airblade/vim-gitgutter"}
    use {"TimUntersberger/neogit"}

    -- Database
    use {
      "tpope/vim-dadbod",
      requires = {
        {"kristijanhusak/vim-dadbod-ui"}
      }
    }

    -- Cmake
    use {"ilyachur/cmake4vim"}

    -- Golang
    use {"fatih/vim-go", ft = {"go"}}

    -- Rust
    use {"rust-lang/rust.vim", ft = {"rust"}}

    -- Lua Development for Neovim
    use {"tjdevries/nlua.nvim"}
    use {"rafcamlet/nvim-luapad"}
  end
)