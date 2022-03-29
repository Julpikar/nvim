local timeout_in_ms = 300
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

local AutoSave = {}

local function write()
  if not api.nvim_buf_get_option(0, "modified") then
    return
  end

  local first_char_pos = fn.getpos("'[")
  local last_char_pos = fn.getpos("']")

  cmd("silent! write!")

  fn.setpos("'[", first_char_pos)
  fn.setpos("']", last_char_pos)

  local time = vim.fn.strftime("%H:%M:%S")
  print("autosave at " .. time)
end

local queued = false
local function defer_func(func, timeout)
  if queued then
    return
  end
  vim.defer_fn(
    function()
      queued = false
      func()
    end,
    timeout
  )
  queued = true
end

local function save()
  if not api.nvim_buf_get_option(0, "modifiable") then
    return
  end
  defer_func(write, timeout_in_ms)
end

function AutoSave.setup()
  local event = {"InsertLeave", "TextChanged"}
  local auto_save_augroup = api.nvim_create_augroup("AutoSave", {clear = true})
  api.nvim_create_autocmd(event, {callback = save, group = auto_save_augroup})
end

return AutoSave
