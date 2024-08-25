local Neotest = {
  "nvim-neotest/neotest",
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "fredrikaverpil/neotest-golang" },
    { "rouge8/neotest-rust" },
  },
  -- ft = { "go", "rust" },
}

Neotest.config = function()
  require("neotest").setup({
    adapters = {
      require("neotest-golang"),
      require("rustaceanvim.neotest"),
    },
  })
end

return Neotest
