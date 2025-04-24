local Fidget = {
  "j-hui/fidget.nvim",
  opts = {
    -- Options related to notification subsystem
    notification = {
      override_vim_notify = true,
    },
  },
  event = "VeryLazy",
}

return Fidget
