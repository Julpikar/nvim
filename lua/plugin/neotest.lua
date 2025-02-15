local Neotest = {
  "nvim-neotest/neotest",
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "fredrikaverpil/neotest-golang" },
  },
}

Neotest.config = function()
  require("neotest").setup({
    adapters = {
      require("neotest-golang"),
    },
  })
end

return Neotest
