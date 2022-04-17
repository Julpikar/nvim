require("impatient")

local api = vim.api
local fn = vim.fn

local function auto_reload()
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

local reload_augroups = api.nvim_create_augroup("Reload", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.schedule(auto_reload)
	end,
	pattern = "$MYVIMRC",
	group = reload_augroups,
})

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	api.nvim_command([[packadd packer.nvim"]])
end

require("local").load_settings()
require("plugin").load_plugins()
require("lsp").load_settings()
