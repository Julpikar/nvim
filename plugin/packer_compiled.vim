" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
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

_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\FixCursorHold.nvim"
  },
  cmake4vim = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmake4vim"
  },
  ["completion-buffers"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-buffers"
  },
  ["completion-nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-treesitter"
  },
  delimitMate = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\delimitMate"
  },
  editorconfig = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\editorconfig"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\goyo.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\limelight.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp_extensions.nvim"
  },
  nerdcommenter = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdtree-git-plugin"
  },
  ["night-owl.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\night-owl.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nlua.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nord-vim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsputils"
  },
  ["nvim-luadev"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-luadev"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-terminal.lua"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-refactor"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  popfix = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-autoformat"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-better-whitespace"
  },
  ["vim-clang-format"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-clang-format"
  },
  ["vim-conda"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-conda"
  },
  ["vim-dadbod"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-go"
  },
  ["vim-lastplace"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lastplace"
  },
  ["vim-lua-format"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lua-format"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-nerdtree-syntax-highlight"
  },
  ["vim-prettier"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-prettier"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-rooter"
  },
  ["vim-startify"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround"
  },
  ["vim-twiggy"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-twiggy"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-vsnip-integ"
  },
  ["vim-which-key"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-which-key"
  },
  vimpeccable = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vimpeccable"
  },
  ["vista.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "C:\\Users\\benawas\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vista.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: editorconfig
loadstring('\27LJ\2\nZ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0')()
vim.cmd("packadd editorconfig")
-- Setup for: vim-rooter
loadstring("\27LJ\2\nR\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\n.git/\17package.json\15Cargo.toml\19rooter_pattern\6g\bvim\0")()
vim.cmd("packadd vim-rooter")
-- Post-load configuration
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType table: 0x020466082a48 ++once call s:load(['vim-clang-format'], { "ft": "table: 0x020466082a48" })
  au FileType rust ++once call s:load(['rust.vim'], { "ft": "rust" })
  au FileType go ++once call s:load(['vim-go'], { "ft": "go" })
  au FileType table: 0x020466082a90 ++once call s:load(['vim-clang-format'], { "ft": "table: 0x020466082a90" })
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
