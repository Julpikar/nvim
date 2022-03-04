local exclude_filetype = {}
local event = {"InsertLeave", "TextChanged"}
local timeout = 300
local cmd = vim.cmd
local fn = vim.fn
local M = {}

local function write()
  if not vim.api.nvim_buf_get_option(0, "modified") then
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
local function defer_fn(fn, timeout)
  if queued then
    return
  end
  vim.defer_fn(
    function()
      queued = false
      fn()
    end,
    timeout
  )
  queued = true
end

function M.save()
  if not vim.api.nvim_buf_get_option(0, "modifiable") then
    return
  end
  defer_fn(write, timeout)
end

function M.setup()
  cmd("augroup AutoSave")
  cmd("autocmd!")
  for index = 1, #event do
    local command = string.format("autocmd %s * lua require('local.autosave').save()", event[index])
    cmd(command)
  end
  cmd("augroup END")
end

return M
