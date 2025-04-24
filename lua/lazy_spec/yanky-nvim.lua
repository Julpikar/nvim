local Yanky = {
  "gbprod/yanky.nvim",
  opts = {},
  keys = {
    { "<SPACE>p", "<cmd>YankyRingHistory<cr>", mode = { "n", "x" }, desc = "Yanky: Open Yank History" },
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yanky: Yank Text" },
    { "p", mode = { "n", "x" }, "<Plug>(YankyPutAfter)", desc = "Yanky: Put After" },
    { "P", mode = { "n", "x" }, "<Plug>(YankyPutBefore)", desc = "Yanky: Put Before" },
    { "gp", mode = { "n", "x" }, "<Plug>(YankyGPutAfter)", desc = "Yanky: Put After And Leave Cursor After Text" },
    { "gP", mode = { "n", "x" }, "<Plug>(YankyGPutBefore)", desc = "Yanky: Put Before And Leave Cursor After Text" },
    { "<c-p>", mode = "n", "<Plug>(YankyPreviousEntry)", desc = "Yanky: Previous Entry" },
    { "<c-n>", mode = "n", "<Plug>(YankyNextEntry)", desc = "Yanky: Next Entry" },
  },
}

return Yanky
