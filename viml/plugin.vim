call plug#begin('~/AppData/Local/nvim-data/site/autoload')

	" init
	Plug 'tpope/vim-sensible'

	" colorscheme
	Plug 'sainnhe/edge'
	Plug 'sainnhe/forest-night'
	Plug 'sainnhe/sonokai'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'glepnir/oceanic-material'
	Plug 'ajmwagar/vim-deus'
	Plug 'tyrannicaltoucan/vim-quantum'

	" editing
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/vim-easy-align'
	Plug 'ntpeters/vim-better-whitespace' " whitespace
	Plug 'junegunn/vim-easy-align'
	Plug 'farmergreg/vim-lastplace' "reopen files at your last edit position
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-surround'

	" utilities
	Plug 'ryanoasis/vim-devicons'
	Plug 'itchyny/lightline.vim'
	Plug 'maximbaz/lightline-ale'
	Plug 'mengelbrecht/lightline-bufferline'
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'
	Plug 'mhinz/vim-startify'
	Plug 'liuchengxu/vista.vim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-lua/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter'

	" linter
	Plug 'dense-analysis/ale'

	" language server and snippet
	Plug 'neovim/nvim-lspconfig'  " Collection of common configurations for the Nvim LSP client
	Plug 'tjdevries/lsp_extensions.nvim' " Extensions to built-in LSP, for example, providing type inlay hints
	Plug 'nvim-lua/completion-nvim' " Autocompletion framework for built-in LSP
	Plug 'nvim-lua/diagnostic-nvim' " Diagnostic navigation and settings for built-in LSP
	Plug 'nvim-lua/lsp-status.nvim' "generating statusline components from the built-in LSP client
	Plug 'RishabhRD/popfix'
	Plug 'RishabhRD/nvim-lsputils' "plugin focuses on making such LSP actions highly user friendly


	" snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

	"html
	Plug 'othree/html5.vim',{ 'on_ft' : ['html']}
	Plug 'cakebaker/scss-syntax.vim',{ 'on_ft' : ['scss','sass']}
	Plug 'ap/vim-css-color',{ 'on_ft' : ['css','scss','sass','less','styl']}
	Plug 'hail2u/vim-css3-syntax',{ 'on_ft' : ['css','scss','sass']}
	Plug 'groenewege/vim-less',{ 'on_ft' : ['less']}

	" go
	Plug 'fatih/vim-go',{ 'on_ft' : 'go' }

	" julia
	Plug 'JuliaEditorSupport/julia-vim'

	" php
	Plug 'StanAngeloff/php.vim',{ 'on_ft' : 'php'}
	Plug '2072/PHP-Indenting-for-VIm',{ 'on_ft' : 'php'}
	Plug 'rafi/vim-phpspec',{ 'on_ft' : 'php'}

	" rust
	Plug 'rust-lang/rust.vim'

	" git
	Plug 'jreybert/vimagit'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-rhubarb'

	" python
	Plug 'cjrh/vim-conda'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'Vimjas/vim-python-pep8-indent'

	" sql
	Plug 'tpope/vim-dadbod',{'merged' : 0}

	" testing
	Plug 'vim-test/vim-test'

	" toml
	Plug 'cespare/vim-toml',{'merged' : 0}

	" vimscript
	Plug 'rbtnn/vim-vimscript_indentexpr'

	" typescript
	Plug 'pangloss/vim-javascript'    " JavaScript support
	Plug 'leafgarland/typescript-vim' " TypeScript syntax
	Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

call plug#end()
