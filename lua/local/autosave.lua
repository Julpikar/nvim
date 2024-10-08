local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local timeout_in_ms = 300

local AutoSave = {}

local function write()
  if
    not api.nvim_get_option_value("modified", { buf = 0 }) or not api.nvim_get_option_value("modifiable", { buf = 0 })
  then
    return
  end

  local first_char_pos = fn.getpos("'[")
  local last_char_pos = fn.getpos("']")

  cmd("silent! write!")

  fn.setpos("'[", first_char_pos)
  fn.setpos("']", last_char_pos)

  local time = fn.strftime("%H:%M:%S")
  vim.notify("File has saved at " .. time, vim.log.levels.INFO, { title = "Auto Save", icon = "󱣫" })
end

local queued = false
local function defer_func(func, timeout)
  if queued then
    return
  end
  vim.defer_fn(function()
    queued = false
    func()
  end, timeout)
  queued = true
end

local function save()
  if
    not api.nvim_get_option_value("modified", { buf = 0 }) or not api.nvim_get_option_value("modifiable", { buf = 0 })
  then
    return
  end
  defer_func(write, timeout_in_ms)
end

function AutoSave.setup()
  local event = { "InsertLeave", "TextChanged" }
  local auto_save_augroup = api.nvim_create_augroup("AutoSave", { clear = true })
  api.nvim_create_autocmd(event, { group = auto_save_augroup, callback = save })
end

return AutoSave
