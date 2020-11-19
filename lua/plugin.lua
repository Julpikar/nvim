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
        use {
            'editorconfig/editorconfig',
            setup = function()
            vim.g.EditorConfig_exclude_patterns = {
                'fugitive://.*',
                'scp://.*'
            }
            end
        }

        use {'jiangmiao/auto-pairs'}
        use {'junegunn/vim-easy-align'}
        use {'ntpeters/vim-better-whitespace'} -- whitespace
        use {'farmergreg/vim-lastplace'} -- "reopen files at your last edit position
        use {'terryma/vim-multiple-cursors'}
        use {'tpope/vim-surround'}

        -- Utilities
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
            'itchyny/lightline.vim',
            requires = {
                {'mengelbrecht/lightline-bufferline'}
            }
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
        use {'nvim-treesitter/nvim-treesitter'}

        -- COC
        use {
            'neoclide/coc.nvim',
            requires = {
                {'josa42/vim-lightline-coc'}
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
        use {
            'tpope/vim-fugitive',
            requires = {
                {'tpope/vim-rhubarb'},
                {'sodapopcan/vim-twiggy'}
            }
        }
        use {'airblade/vim-gitgutter'}

        -- Testing
        use {'vim-test/vim-test'}

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

    end)
