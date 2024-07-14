local ToggleTerm = {
  "akinsho/toggleterm.nvim",
  version = "*",
}

ToggleTerm.opts = {
  -- size can be a number or function which is passed the current
  -- terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns / 2
    end
  end,
}

ToggleTerm.config = function(_, opts)
  require("toggleterm").setup(opts)

  local Terminal = require("toggleterm.terminal").Terminal

  -- Lazygit
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

  -- Global CMD
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
  vim.keymap.set("n", "<LEADER>tv", toggle_cmd_sv)

  local toggle_cmd_sh = function()
    cmd.dir = vim.fn.getcwd()
    cmd.direction = "horizontal"
    cmd:toggle()
  end
  vim.keymap.set("n", "<LEADER>th", toggle_cmd_sh)

  -- Buffer CMD
  local buffer_cmd = Terminal:new({ cmd = "cmd", direction = "float", hidden =
  true })
  local toggle_cmd = function()
    buffer_cmd.dir = vim.fn.expand("%:p:h")
    buffer_cmd:toggle()
  end
  vim.keymap.set("n", "<f7>", toggle_cmd)
end

return ToggleTerm
