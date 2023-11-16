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
  local cmd = Terminal:new({ cmd = "cmd", hidden = true })

  local toggle_cmd_float = function()
    cmd.dir = vim.fn.getcwd()
    cmd.direction = "float"
    cmd:toggle()
  end
  vim.keymap.set("n", "<f6>", toggle_cmd_float)

  local toggle_cmd_sv = function()
    cmd.dir = vim.fn.getcwd()
    cmd.direction = "vertical"
    cmd:toggle()
  end
  vim.keymap.set("n", "<LEADER>sv", toggle_cmd_sv)

  local toggle_cmd_sh = function()
    cmd.dir = vim.fn.getcwd()
    cmd.direction = "horizontal"
    cmd:toggle()
  end
  vim.keymap.set("n", "<LEADER>sh", toggle_cmd_sh)
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
  require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns / 2
      end
    end,
  })
  term_lazygit()
  term_cmd_root()
  term_cmd_buffer()
end

return Toggleterm
