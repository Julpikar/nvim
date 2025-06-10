local Conform = {
  "stevearc/conform.nvim",
}

Conform.opts = {
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    cmake = { "cmake_format" },
    json = { "clang_format" },
    lua = { "stylua" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },
    ["_"] = { "trim_whitelines", "trim_whitespace" },
  },
  default_format_opts = { lsp_format = "fallback" },
  formatters = {
    ["clang_format"] = {
      prepend_args = {
        "-style",
        "{BasedOnStyle: LLVM, AlwaysBreakTemplateDeclarations: Yes, BreakTemplateDeclarations: true}",
      },
    },
  },
}

Conform.config = function(_, opts)
  require("conform").setup(opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

Conform.keys = {
  { "gq" },
  {
    "<leader>lf",
    mode = { "n", "v" },
    function()
      require("conform").format({ async = true }, function()
        vim.notify(
          vim.fn.expand("%") .. " has formatted",
          vim.log.levels.INFO,
          { title = "conform.nvim", icon = "󰾽" }
        )
      end)
    end,
    desc = "Conform: Format",
  },
}

return Conform
