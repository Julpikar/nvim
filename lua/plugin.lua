-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
        -- Packer can manage itself as an optional plugin
        use {'wbthomason/packer.nvim', opt = true}

        -- Write your .vimrc in Lua!
        use {'svermeulen/vimpeccable'}

        -- Colorscheme
        use {'sainnhe/edge'}
        use {'sainnhe/forest-night'}
        use {'sainnhe/sonokai'}
        use {'ghifarit53/tokyonight-vim'}
        use {'glepnir/oceanic-material'}
        use {'ajmwagar/vim-deus'}
        use {'tyrannicaltoucan/vim-quantum'}

        -- Editing
        use {'jiangmiao/auto-pairs'}
        use {'junegunn/vim-easy-align'}
        use {'ntpeters/vim-better-whitespace'} -- whitespace
        use {'farmergreg/vim-lastplace'} -- "reopen files at your last edit position
        use {'terryma/vim-multiple-cursors'}
        use {'tpope/vim-surround'}

        -- Utilities
        use {'ryanoasis/vim-devicons'}
        use {'airblade/vim-rooter'}
        use {'cjrh/vim-conda'}
        use {
            'itchyny/lightline.vim',
            requires = {
                {'mengelbrecht/lightline-bufferline'}
            }
        }
        use {'preservim/nerdcommenter'}
        use {
        	'preservim/nerdtree',
        	requires = {'Xuyuanp/nerdtree-git-plugin'}
        }
        use {'mhinz/vim-startify'}
        use {'liuchengxu/vista.vim'}
        use {
            'nvim-lua/telescope.nvim',
            requires = {
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}
            }
        }
        use {'nvim-treesitter/nvim-treesitter'}

        -- LSP
        use {
            'neovim/nvim-lspconfig', --  Collection of common configurations for the Nvim LSP client
            requires = {
                {'tjdevries/lsp_extensions.nvim'}, -- Extensions to built-in LSP, for example, providing type inlay hints
                {'nvim-lua/completion-nvim'}, -- Autocompletion framework for built-in LSP
                {'nvim-lua/diagnostic-nvim'}, -- Diagnostic navigation and settings for built-in LSP
                {'nvim-lua/lsp-status.nvim'}, -- generating statusline components from the built-in LSP client
                {'RishabhRD/popfix'},
                {'RishabhRD/nvim-lsputils'}, -- plugin focuses on making such LSP actions highly user friendly
            }
        }

        -- COC
        use {'neoclide/coc.nvim'}

        -- Linter
        use {
            'dense-analysis/ale',
            requires = {
                {'maximbaz/lightline-ale'}
            }
        }

        -- Snippets
        use {
            'SirVer/ultisnips',
            requires = {
                {'honza/vim-snippets'}
            }
        }

        -- Git
        use {'jreybert/vimagit'}
        use {
            'tpope/vim-fugitive',
            requires = {
                {'tpope/vim-rhubarb'}
            }
        }
        use {'airblade/vim-gitgutter'}

        -- Golang
        use {'fatih/vim-go', ft = {'go'}}

        -- Rust
        use {'rust-lang/rust.vim', ft = {'rust'}}

    end)
