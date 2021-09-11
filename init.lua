local execute = vim.api.nvim_command
local fn = vim.fn

function _G.auto_reload()
  local hls_status = vim.v.hlsearch
  for name, _ in pairs(package.loaded) do
    if name:match("^cnull") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  if hls_status == 0 then
    vim.opt.hlsearch = false
  end
end

execute("augroup Reload")
execute("autocmd!")
execute("autocmd BufWritePre $MYVIMRC lua auto_reload()")
execute("augroup END")

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute [[packadd packer.nvim"]]
end

require("local").load_settings()
require("plugin").load_plugins()
