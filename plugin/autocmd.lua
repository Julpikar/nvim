require("config.number")

local nvim_create_augroup = vim.api.nvim_create_augroup
local nvim_create_autocmd = vim.api.nvim_create_autocmd

local config_augroup = nvim_create_augroup("config_augroup", { clear = true })
local debounce_wrap = require("shared.debounce").debounce_wrap

local quick_save = debounce_wrap(function()
  require("config.autosave").save()
end, 300)

nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
  group = config_augroup,
  callback = quick_save,
})

local slow_save = debounce_wrap(function()
  require("config.autosave").save()
end, 1500)

nvim_create_autocmd({ "TextChanged" }, {
  group = config_augroup,
  callback = slow_save,
})

nvim_create_autocmd("VimLeave", {
  group = config_augroup,
  callback = function()
    require("config.autosave").save_all()
  end,
})

local show_violations = debounce_wrap(function()
  require("config.rules").show_violations()
end, 500)

nvim_create_autocmd({ "BufEnter", "BufWritePost", "TermOpen" }, {
  group = config_augroup,
  callback = show_violations,
})

nvim_create_autocmd("BufWinEnter", {
  group = config_augroup,
  callback = function()
    require("config.lastplace").goto_last_position()
  end,
})

nvim_create_autocmd("BufEnter", {
  group = config_augroup,
  callback = function()
    require("config.lsp")
    require("config.diagnostic")
  end,
})

nvim_create_autocmd({ "BufEnter" }, {
  group = config_augroup,
  pattern = "*",
  callback = function()
    local rooter = require("config.rooter")
    local root, method = rooter.find_pattern_root()
    rooter.set_pwd(root, method)
  end,
})

nvim_create_autocmd("LspAttach", {
  group = config_augroup,
  pattern = "*",
  callback = function()
    local rooter = require("config.rooter")
    local root, method = rooter.find_lsp_root()
    rooter.set_pwd(root, method)
  end,
})
