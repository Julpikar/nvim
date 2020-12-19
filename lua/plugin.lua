-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
        -- Packer can manage itself as an optional plugin
        use {'wbthomason/packer.nvim', opt = true}

        -- Lua keymapping helper
        use {'svermeulen/vimpeccable'}

        -- Colorscheme
        use {'sainnhe/forest-night'}
        use {'sainnhe/sonokai'}
        use {'Julpikar/night-owl.nvim'}
        use {'glepnir/oceanic-material'}

        -- Editing
        use {
                'editorconfig/editorconfig',
                setup = function()
                    vim.g.EditorConfig_exclude_patterns = {
                        'fugitive://.*',
                        'scp://.*'
                    }
                end
            }

        use {'junegunn/vim-easy-align'}
        use {'ntpeters/vim-better-whitespace'} -- whitespace
        use {'farmergreg/vim-lastplace'} -- "reopen files at your last edit position
        use {'mg979/vim-visual-multi',branch = 'master',}
        use {'tpope/vim-surround'}
        use {'Raimondi/delimitMate'}
        use {'Chiel92/vim-autoformat'}

        -- Focusing
        use {'junegunn/goyo.vim'}
        use {'junegunn/limelight.vim'}

        -- Color
        use {'norcalli/nvim-colorizer.lua'}
        use {'norcalli/nvim-terminal.lua'}

        -- Utilities
        use {'akinsho/nvim-bufferline.lua'}
        use {'akinsho/nvim-toggleterm.lua'}
        use {'kyazdani42/nvim-web-devicons'}
        use {'ryanoasis/vim-devicons'}
        use {'cjrh/vim-conda'}
        use {
                'airblade/vim-rooter',
                setup = function()
                    vim.g.rooter_pattern = {
                        '.git/',
                        'package.json',
                        'Cargo.toml'
                    }
                end
            }

        use {
                'glepnir/galaxyline.nvim',
                branch = 'main',
            }
        use {'preservim/nerdcommenter'}
        use {
                'preservim/nerdtree',
                requires = {
                    {'Xuyuanp/nerdtree-git-plugin'},
                    {'tiagofumo/vim-nerdtree-syntax-highlight'}
                }
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
        use {'antoinemadec/FixCursorHold.nvim'}

        -- Treesitter
        use {
                'nvim-treesitter/nvim-treesitter',
                requires = {
                    {'p00f/nvim-ts-rainbow'},
                    {'nvim-treesitter/nvim-treesitter-refactor'},
                    {'nvim-treesitter/completion-treesitter'}
                }
            }

        -- Neovim Builtin LSP
        use {
                'neovim/nvim-lspconfig',
                requires = {
                    {'nvim-lua/lsp_extensions.nvim'},
                    {'nvim-lua/completion-nvim'},
                    {'nvim-lua/lsp-status.nvim'},
                    {'steelsojka/completion-buffers'},
                    {'RishabhRD/popfix'},
                    {'RishabhRD/nvim-lsputils'}
                }
            }

        -- Snippets
        use {
                'hrsh7th/vim-vsnip',
                requires = {
                    {'hrsh7th/vim-vsnip-integ', opt = true}
                }
            }

        -- Git
        use {
                'tpope/vim-fugitive',
                requires = {
                    {'tpope/vim-rhubarb'},
                    {'sodapopcan/vim-twiggy'}
                }
            }
        use {'airblade/vim-gitgutter'}

        -- Database
        use {
                'tpope/vim-dadbod',
                requires = {
                    {'kristijanhusak/vim-dadbod-ui'}
                }
            }

        -- Cmake
        use {'ilyachur/cmake4vim'}

        -- C & C++
        use {
                'rhysd/vim-clang-format',
                ft = {
                    {'c'},
                    {'cpp'}
                }
            }

        -- Golang
        use {'fatih/vim-go', ft = {'go'}}

        -- Rust
        use {'rust-lang/rust.vim', ft = {'rust'}}

        -- Lua Development for Neovim
        use {'tjdevries/nlua.nvim'}
        use {'bfredl/nvim-luadev'}
        use {'andrejlevkovitch/vim-lua-format'}
    end)
