" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "C:\\Users\\Benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.dashboard\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dashboard-nvim"
  },
  delimitMate = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\23plugin.delimitmate\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\delimitMate"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18plugin.format\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.galaxyline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\gruvbox-material"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\hop.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19plugin.lspkind\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19plugin.lspsaga\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["nord-vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nord-vim"
  },
  ["numbers.vim"] = {
    config = { "\27LJ\2\n \1\0\0\b\0\t\0\0176\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0\22:NumbersOnOff<CR>\t<F6>\23:NumbersToggle<CR>\t<F5>\6n\1\0\1\fnoremap\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\numbers.vim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.bufferline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\17plugin.compe\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.lightbulb\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.lspconfig\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\16plugin.tree\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.treesitter\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["oceanic-material"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\oceanic-material"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  sonokai = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\sonokai"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.whitespace\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-better-whitespace"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod-ui"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.easyalign\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-easy-align"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugin.floaterm\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lastplace"
  },
  ["vim-nightfly-guicolors"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme nightfly\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-nightfly-guicolors"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.vim-rooter\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-rooter"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\17plugin.vsnip\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-which-key"] = {
    config = { "\27LJ\2\nq\0\0\6\0\a\0\f6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\3'\5\5\0B\3\2\2'\4\6\0&\2\4\2B\0\2\1K\0\1\0\28/viml/whichkey/init.vim\vconfig\fstdpath\afn\fsource \bcmd\bvim\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-which-key"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\17plugin.vista\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vista.vim"
  }
}

-- Setup for: oceanic-material
try_loadstring('\27LJ\2\nÍ\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0K\0\1\0%oceanic_material_allow_undercurl%oceanic_material_allow_underline"oceanic_material_allow_italic oceanic_material_allow_bold\6g\bvim\0', "setup", "oceanic-material")
vim.cmd [[packadd oceanic-material]]
-- Setup for: numbers.vim
try_loadstring("\27LJ\2\n_\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\6\0\0\14dashboard\rNvimTree\vpacker\14telescope\nvista\20numbers_exclude\6g\bvim\0", "setup", "numbers.vim")
vim.cmd [[packadd numbers.vim]]
-- Setup for: gruvbox-material
try_loadstring("\27LJ\2\nÞ\1\0\0\2\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0+\1\2\0=\1\6\0+\1\2\0=\1\a\0'\1\t\0=\1\b\0K\0\1\0\ngreen\28gruvbox_material_cursor#gruvbox_material_enable_italic!gruvbox_material_enable_bold\thard gruvbox_material_background\rmaterial\29gruvbox_material_palette\6g\bvim\0", "setup", "gruvbox-material")
vim.cmd [[packadd gruvbox-material]]
-- Setup for: vim-nightfly-guicolors
try_loadstring("\27LJ\2\na\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0 nightflyUnderlineMatchParen\24nightflyCursorColor\6g\bvim\0", "setup", "vim-nightfly-guicolors")
vim.cmd [[packadd vim-nightfly-guicolors]]
-- Config for: dashboard-nvim
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.dashboard\frequire\0", "config", "dashboard-nvim")
-- Config for: gruvbox-material
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "gruvbox-material")
-- Config for: lspsaga.nvim
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19plugin.lspsaga\frequire\0", "config", "lspsaga.nvim")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\17plugin.compe\frequire\0", "config", "nvim-compe")
-- Config for: vim-floaterm
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugin.floaterm\frequire\0", "config", "vim-floaterm")
-- Config for: nvim-lightbulb
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.lightbulb\frequire\0", "config", "nvim-lightbulb")
-- Config for: formatter.nvim
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18plugin.format\frequire\0", "config", "formatter.nvim")
-- Config for: oceanic-material
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "oceanic-material")
-- Config for: delimitMate
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\23plugin.delimitmate\frequire\0", "config", "delimitMate")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.treesitter\frequire\0", "config", "nvim-treesitter")
-- Config for: vim-which-key
try_loadstring("\27LJ\2\nq\0\0\6\0\a\0\f6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\3'\5\5\0B\3\2\2'\4\6\0&\2\4\2B\0\2\1K\0\1\0\28/viml/whichkey/init.vim\vconfig\fstdpath\afn\fsource \bcmd\bvim\0", "config", "vim-which-key")
-- Config for: vista.vim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\17plugin.vista\frequire\0", "config", "vista.vim")
-- Config for: vim-nightfly-guicolors
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme nightfly\bcmd\bvim\0", "config", "vim-nightfly-guicolors")
-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\16plugin.tree\frequire\0", "config", "nvim-tree.lua")
-- Config for: numbers.vim
try_loadstring("\27LJ\2\n \1\0\0\b\0\t\0\0176\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0\22:NumbersOnOff<CR>\t<F6>\23:NumbersToggle<CR>\t<F5>\6n\1\0\1\fnoremap\2\20nvim_set_keymap\bapi\bvim\0", "config", "numbers.vim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: lspkind-nvim
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19plugin.lspkind\frequire\0", "config", "lspkind-nvim")
-- Config for: vim-easy-align
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.easyalign\frequire\0", "config", "vim-easy-align")
-- Config for: nord-vim
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nord-vim")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugin.lspconfig\frequire\0", "config", "nvim-lspconfig")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.galaxyline\frequire\0", "config", "galaxyline.nvim")
-- Config for: vim-better-whitespace
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.whitespace\frequire\0", "config", "vim-better-whitespace")
-- Config for: vim-rooter
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.vim-rooter\frequire\0", "config", "vim-rooter")
-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugin.bufferline\frequire\0", "config", "nvim-bufferline.lua")
-- Config for: vim-vsnip
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\17plugin.vsnip\frequire\0", "config", "vim-vsnip")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
