local buftype_exclude = { "nofile", "prompt" }

local filetype_exclude = {}

local number_state = { number = false, rnumber = false }

local function save_current_state()
  number_state.number = vim.o.number
  number_state.rnumber = vim.o.relativenumber
end

local function load_last_state()
  vim.o.number = number_state.number
  vim.o.relativenumber = number_state.rnumber
end

local function exclude_number()
  return vim.tbl_contains(buftype_exclude, vim.o.buftype) or vim.tbl_contains(filetype_exclude, vim.o.filetype)
end

local function disable_number()
  vim.o.number = false
  vim.o.relativenumber = false
end

local function set_rnumber()
  vim.o.number = false
  vim.o.relativenumber = true
end

local function set_number()
  vim.o.relativenumber = false
  vim.o.number = true
end

local function toggle_rnumber()
  if exclude_number() then
    disable_number()
    return
  end

  set_rnumber()
end

local function toggle_number()
  if exclude_number() then
    disable_number()
    return
  end

  set_number()
end

local function toggle_focuslost()
  save_current_state()
  set_number()
end

local number_augroup = vim.api.nvim_create_augroup("Number", {})

vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, { group = number_augroup, callback = toggle_number })
vim.api.nvim_create_autocmd(
  { "VimEnter", "WinEnter", "InsertLeave" },
  { group = number_augroup, callback = toggle_rnumber }
)
vim.api.nvim_create_autocmd("FocusLost", { group = number_augroup, callback = toggle_focuslost })
vim.api.nvim_create_autocmd("FocusGained", { group = number_augroup, callback = load_last_state })
