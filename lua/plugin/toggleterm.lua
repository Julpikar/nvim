local Terminal = require("toggleterm.terminal").Terminal

local Toggleterm = {}

local function term_lazygit()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
  })
  local toggle_lazygit = function()
    lazygit.dir = vim.fn.getcwd()
    lazygit:toggle()
  end
  vim.keymap.set("n", "<f5>", toggle_lazygit)
end

local function term_cmd_root()
  local cmd = Terminal:new({ cmd = "cmd", direction = "float", hidden = true })
  local toggle_cmd = function()
    cmd.dir = vim.fn.getcwd()
    cmd:toggle()
  end
  vim.keymap.set("n", "<f6>", toggle_cmd)
end

local function term_cmd_buffer()
  local cmd = Terminal:new({ cmd = "cmd", direction = "float", hidden = true })
  local toggle_cmd = function()
    cmd.dir = vim.fn.expand("%:p:h")
    cmd:toggle()
  end
  vim.keymap.set("n", "<f7>", toggle_cmd)
end
function Toggleterm.config()
  term_lazygit()
  term_cmd_root()
  term_cmd_buffer()
end

return Toggleterm
