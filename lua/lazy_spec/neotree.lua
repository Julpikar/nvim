local Neotree = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {},
  keys = {
    {
      "<F2>",
      function()
        local root = require("config.rooter")
        local path = root.find_lsp_root() or root.find_pattern_root()
        require("neo-tree.command").execute({
          source = "filesystem",
          position = "float",
          toggle = true,
          dir = path,
          reveal = true,
        })
      end,
      desc = "Neotree: Toggle",
    },
  },
}

return Neotree
