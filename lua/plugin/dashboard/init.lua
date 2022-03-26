local g = vim.g
local cmd = vim.cmd

local Dashboard = {}

local function set_logo()
  vim.g.dashboard_custom_header = {
    "",
    "",
    "",
    [[             ___     ___     ___     ___     ___     ___             ]],
    [[         ___/   \___/   \___/   \___/   \___/   \___/   \___         ]],
    [[     ___/   \___/   \___/   \___/   \___/   \___/   \___/   \___     ]],
    [[ ___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___ ]],
    [[/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \]],
    [[\___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/]],
    [[/   \___/                                                   \___/   \]],
    [[\___/                                                           \___/]]
  }
  vim.g.dashboard_custom_footer = {
    [[ ___                                                             ___ ]],
    [[/   \___                                                     ___/   \]],
    [[\___/   \___     ___     ___     ___     ___     ___     ___/   \___/]],
    [[    \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/    ]],
    [[        \___/   \___/   \___/   \___/   \___/   \___/   \___/        ]],
    [[            \___/   \___/   \___/   \___/   \___/   \___/            ]]
  }
end

function Dashboard.keymap()
  vim.keymap.set({"n", "v"}, "<HOME>", "<CMD>Dashboard<CR>", {silent = true})
end

function Dashboard.setup()
  g.dashboard_default_executive = "telescope"
  g.session_enable = false
  g.dashboard_custom_shortcut = {
    last_session = "SPC h s",
    find_history = "SPC h h",
    find_file = "SPC h f",
    change_colorscheme = "SPC h c",
    new_file = "SPC h n",
    find_word = "SPC h w",
    book_marks = "SPC h b"
  }
  set_logo()
end

return Dashboard
