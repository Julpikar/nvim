local Gonvim = {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
  },
  ft = { "go", "gomod" },
}

Gonvim.opts = {
  lsp_cfg = false,
  lsp_on_attach = true,
}

return Gonvim
