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
local package_path_str = "C:\\Users\\benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\benawas\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\FixCursorHold.nvim"
  },
  cmake4vim = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmake4vim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-treesitter"
  },
  delimitMate = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\delimitMate"
  },
  editorconfig = {
    loaded = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\editorconfig"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\goyo.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\limelight.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdtree-git-plugin"
  },
  ["night-owl.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\night-owl.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nlua.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nord-vim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsputils"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-luadev"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-terminal.lua"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-refactor"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-autoformat"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-better-whitespace"
  },
  ["vim-clang-format"] = {
    loaded = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-clang-format"
  },
  ["vim-conda"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-conda"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-go"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lastplace"
  },
  ["vim-lua-format"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lua-format"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-nerdtree-syntax-highlight"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-prettier"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-rooter"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startuptime"
  },
  ["vim-twiggy"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-twiggy"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-which-key"
  },
  vimpeccable = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vimpeccable"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vista.vim"
  }
}

-- Setup for: editorconfig
try_loadstring('\27LJ\2\nZ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0', "setup", "editorconfig")
vim.cmd [[packadd editorconfig]]
-- Setup for: vim-rooter
try_loadstring("\27LJ\2\nR\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\n.git/\17package.json\15Cargo.toml\19rooter_pattern\6g\bvim\0", "setup", "vim-rooter")
vim.cmd [[packadd vim-rooter]]
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType table: 0x01a385a6eae0 ++once lua require("packer.load")({'vim-clang-format'}, { ft = "table: 0x01a385a6eae0" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType table: 0x01a385bcb9c0 ++once lua require("packer.load")({'vim-clang-format'}, { ft = "table: 0x01a385bcb9c0" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
