local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

local AutoSave = {}

function AutoSave.save()
  local bufnr = api.nvim_get_current_buf()
  if
    not api.nvim_get_option_value("modified", { buf = bufnr })
    or not api.nvim_get_option_value("modifiable", { buf = bufnr })
    or #api.nvim_buf_get_name(bufnr) == 0
  then
    return
  end

  local first_char_pos = fn.getpos("'[")
  local last_char_pos = fn.getpos("']")

  vim.api.nvim_buf_call(bufnr, function()
    cmd("silent! write!")
  end)

  fn.setpos("'[", first_char_pos)
  fn.setpos("']", last_char_pos)

  local time = fn.strftime("%H:%M:%S")
  vim.notify("File has saved at " .. time, vim.log.levels.INFO, { title = "Auto Save", icon = "󱣫" })
end

function AutoSave.save_all()
  local bufs = api.nvim_list_bufs()
  for _, bufnr in ipairs(bufs) do
    if
      not api.nvim_buf_is_loaded(bufnr)
      or not api.nvim_get_option_value("modified", { buf = bufnr })
      or not api.nvim_get_option_value("modifiable", { buf = bufnr })
      or #api.nvim_buf_get_name(bufnr) == 0
    then
      return
    end

    vim.api.nvim_buf_call(bufnr, function()
      cmd("silent! wall!")
    end)
  end
end

return AutoSave
