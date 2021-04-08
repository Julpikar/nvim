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
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dashboard-nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox-material"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lazygit.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
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
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-better-whitespace"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lastplace"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-rooter"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-which-key"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "C:\\Users\\Benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vista.vim"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
