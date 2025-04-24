local o = vim.o

local mode = false
local focus = true
local enable_number = true
local buftype_exclude = { "terminal" }
local filetype_exclude = {
  "DiffviewFiles",
  "fzf",
  "lazy",
  "log",
  "mason",
  "NeogitStatus",
  "neo-tree",
  "neo-tree-popup",
  "Outline",
  "OverseerList",
  "qf",
  "TelescopePrompt",
  "toggleterm",
  "trouble",
}

local function relative_number_off()
  o.relativenumber = false
  o.number = true
end

local function number_set_toggle()
  if mode == true then
    mode = false
    o.relativenumber = true
  else
    mode = true
    relative_number_off()
  end
end

local function reset_number()
  if focus == false then
    relative_number_off()
  elseif mode == false then
    o.relativenumber = true
  else
    relative_number_off()
  end

  if vim.tbl_contains(filetype_exclude, o.filetype or vim.tbl_contains(buftype_exclude, o.buftype)) then
    vim.o.relativenumber = false
    vim.o.number = false
  end
end

local function set_number()
  mode = true
  reset_number()
end

local function set_relative()
  mode = false
  reset_number()
end

local function win_on_focus()
  focus = true
  reset_number()
end

local function win_not_focus()
  focus = false
  reset_number()
end

local function number_set_enable()
  local number_enable_augroup = vim.api.nvim_create_augroup("EnableNumber", {
    clear = true,
  })
  local nvim_create_autocmd = vim.api.nvim_create_autocmd
  nvim_create_autocmd({ "InsertEnter", "WinLeave" }, { callback = set_number, group = number_enable_augroup })
  nvim_create_autocmd({ "InsertLeave", "WinEnter" }, { callback = set_relative, group = number_enable_augroup })
  nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, { callback = reset_number, group = number_enable_augroup })
  nvim_create_autocmd("FocusLost", { callback = win_not_focus, group = number_enable_augroup })
  nvim_create_autocmd("FocusGained", { callback = win_on_focus, group = number_enable_augroup })

  enable_number = true
  o.relativenumber = true
  o.number = true
end

local function number_set_disable()
  enable_number = false
  o.number = false
  vim.api.nvim_del_augroup_by_name("EnableNumber")
end

local function number_switch_on_off()
  if enable_number == true then
    number_set_disable()
  else
    number_set_enable()
  end
end

local nvim_create_user_command = vim.api.nvim_create_user_command
nvim_create_user_command("NumberToggle", number_set_toggle, { bang = true, nargs = 0 })
nvim_create_user_command("NumberEnable", number_set_enable, { bang = true, nargs = 0 })
nvim_create_user_command("NumberDisable", number_set_disable, { bang = true, nargs = 0 })
nvim_create_user_command("NumberOnOff", number_switch_on_off, { bang = true, nargs = 0 })
if enable_number then
  number_set_enable()
else
  number_set_disable()
end
