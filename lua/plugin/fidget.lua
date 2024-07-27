local Fidget = {
  "j-hui/fidget.nvim",
  lazy = false,
}

Fidget.opts = {
  -- Options related to notification subsystem
  notification = {
    override_vim_notify = true,
  },
  -- Options related to integrating with other plugins
  integration = {
    ["nvim-tree"] = {
      enable = true,
    },
  },
}

Fidget.keys = {
  { "<LEADER>h", "<CMD>Fidget history<CR>", desc = "Fidget History" },
}

return Fidget
