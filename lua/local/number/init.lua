-- from numbers.vim, see https://github.com/myusuf3/numbers.vim

local utils = require("utils")

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local mode = false
local center = true

local Number = {
  enable_number = true,
  numbers_exclude = {"dashboard", "floaterm", "NvimTree", "Outline", "packer", "telescope"}
}

local function relative_off()
  cmd [[set norelativenumber]]
  cmd [[set number]]
end

function Number.toggle()
  if mode == true then
    mode = false
    cmd [[set relativenumber]]
  else
    mode = true
    relative_off()
  end
end

function Number.reset_number()
  if center == false then
    relative_off()
  elseif mode == false then
    cmd [[set relativenumber]]
  else
    relative_off()
  end

  if fn.index(Number.numbers_exclude, o.filetype) >= 0 then
    cmd [[setlocal norelativenumber]]
    cmd [[setlocal nonumber]]
  end
end
function Number.set_number()
  mode = true
  Number.reset_number()
end

function Number.set_relative()
  mode = false
  Number.reset_number()
end

function Number.center()
  center = true
  Number.reset_number()
end

function Number.uncenter()
  center = false
  Number.reset_number()
end

function Number.enable()
  local autocmd = {
    enable = {
      {"InsertEnter", "*", "lua require('local.number').set_number()"},
      {"InsertLeave", "*", "lua require('local.number').set_relative()"},
      {"BufNewFile", "*", "lua require('local.number').reset_number()"},
      {"BufReadPost", "*", "lua require('local.number').reset_number()"},
      {"FocusLost", "*", "lua require('local.number').uncenter()"},
      {"FocusGained", "*", "lua require('local.number').center()"},
      {"WinEnter", "*", "lua require('local.number').set_relative()"},
      {"WinLeave", "*", "lua require('local.number').set_number()"}
    }
  }

  Number.enable_number = true
  cmd [[set relativenumber]]
  cmd [[set number]]
  utils.nvim_create_augroups(autocmd)
end

function Number.disable()
  Number.enable_number = false
  cmd [[:set nu]]
  cmd [[:set nu!]]

  cmd [[augroup disable]]
  cmd [[au!]]
  cmd [[au! enable]]
  cmd [[augroup END]]
end

function Number.switch_on_off()
  if Number.enable_number == true then
    Number.disable()
  else
    Number.enable()
  end
end

function Number.setup(config)
  if config ~= nil then
    Number.enable_number = config.enable_number
  end

  cmd [[command! -nargs=0 NumberToggle lua require('local.number').toggle()]]
  cmd [[command! -nargs=0 NumberEnable lua require('local.number').enable()]]
  cmd [[command! -nargs=0 NumberDisable lua require('local.number').disable()]]
  cmd [[command! -nargs=0 NumberOnOff lua require('local.number').switch_on_off()]]

  if Number.enable_number then
    Number.enable()
  else
    Number.disable()
  end
end

return Number
