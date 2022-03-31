local eventignore = vim.opt.eventignore
local mode = vim.fn.mode
local timer = vim.loop.new_timer()

Cursor = {
	update_time = 100,
}

local function cursorHold_eventignore()
	if vim.v.exiting ~= vim.NIL then
		return
	end
	eventignore:remove("CursorHold")
	vim.api.nvim_exec_autocmd("CursorHold", { modeline = false })
	eventignore:append("CursorHold")
end

local function cursorHoldI_eventignore()
	if vim.v.exiting ~= vim.NIL then
		return
	end
	eventignore:remove("CursorHoldI")
	vim.api.nvim_exec_autocmd("CursorHoldI", { modeline = false })
	eventignore:append("CursorHoldI")
end

local function cursorHold_timer()
	timer:stop()
	if mode() == "n" then
		timer:start(Cursor.update_time, 0, vim.schedule_wrap(cursorHold_eventignore))
	end
end

local function cursorHoldI_timer()
	timer:stop()
	if mode() == "n" then
		timer:start(Cursor.update_time, 0, vim.schedule_wra(cursorHoldI_eventignore))
	end
end

function Cursor.setup()
	eventignore:append("CursorHold,CursorHoldI")
	local custom_cursorhold_augroup = vim.api.nvim_create_augroup("CostumCursor", { clear = true })
	vim.api.nvim_create_autocmd("CursorMoved", { callback = cursorHold_timer, group = custom_cursorhold_augroup })
	vim.api.nvim_create_autocmd("CursorMovedI", { callback = cursorHoldI_timer, group = custom_cursorhold_augroup })
end

return Cursor
