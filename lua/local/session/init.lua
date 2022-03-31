local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

local config = {
	session_dir = fn.stdpath("data") .. "/sessions/",
}

local Session = {}

local function session_name_escape(name)
	if vim.o.shellslash then
		return string.gsub(name, ":/", "__"):gsub("/", "_")
	end
	return string.gsub(name, ":\\", "__"):gsub("\\", "_")
end

local function get_session_path(session_name)
	session_name = session_name and session_name or fn.getcwd()
	session_name = session_name_escape(session_name)
	return string.format(config.session_dir .. "/%s.vim", session_name)
end

local function restore_session(session_name)
	local command = "source " .. get_session_path(session_name)
	local success, result = pcall(cmd, command)
	if not success then
		print("session restore error at:", result)
		return
	end
end

local function save_session(session_name)
	local command = "mksession! " .. get_session_path(session_name)
	cmd(command)
end

function Session.setup()
	if fn.isdirectory(config.session_dir) == 0 then
		fn.mkdir(config.session_dir)
	end

	local session_augroup = api.nvim_create_augroup("Session", { clear = true })
	api.nvim_create_autocmd("VimEnter", { callback = restore_session, group = session_augroup })
	api.nvim_create_autocmd("VimLeave", { callback = save_session, group = session_augroup })
end

return Session
