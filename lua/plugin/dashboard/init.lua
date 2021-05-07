local g = vim.g
local cmd = vim.cmd

local Dashboard = {}

local function set_logo()
  vim.g.dashboard_custom_header = {
    "♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜",
    "♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟",
    "▓░▓░▓░▓░███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗▓░▓░▓░▓░",
    "░▓░▓░▓░▓████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║░▓░▓░▓░▓",
    "▓░▓░▓░▓░██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║▓░▓░▓░▓░",
    "░▓░▓░▓░▓██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║░▓░▓░▓░▓",
    "▓░▓░▓░▓░██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║▓░▓░▓░▓░",
    "░▓░▓░▓░▓╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░▓░▓░▓░▓",
    "♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙",
    "♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖"
  }
  vim.g.dashboard_custom_footer = {
    "♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜♜♞♝♚♛♝♞♜",
    "♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟♟",
    "▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░",
    "░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓",
    "▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░",
    "░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓░▓",
    "♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙♙",
    "♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖♖♘♗♔♕♗♘♖"
  }
end

local function set_keymap()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<HOME>", "<CMD>Dashboard<CR>", {silent = true})
  remap("v", "<HOME>", "<CMD>Dashboard<CR>", {silent = true})
end

local function set_highlight()
  cmd [[highlight dashboardFooter ctermfg=white guifg=white]]
  cmd [[highlight dashboardHeader ctermfg=white guifg=white]]
  cmd [[highlight dashboardCenter ctermfg=white guifg=white]]
  cmd [[highlight dashboardShortCut ctermfg=white guifg=white]]
end

function Dashboard.config()
  g.dashboard_default_executive = "telescope"
  set_keymap()
  set_logo()
  set_highlight()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Dashboard})
    return self
  end
}
setmetatable(Dashboard, metatable)

return Dashboard
