local Gonvim = {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
  },
  ft = { "go", "gomod" },
}

local function custom_on_attach()
  local keymap_set = vim.keymap.set

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below
  -- functions
  keymap_set("n", "<space>e", vim.diagnostic.open_float)
  keymap_set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = { border = "rounded" } })
  end)
  keymap_set("n", "]d", function()
    vim.diagnostic.goto_next({ float = { border = "rounded" } })
  end)
  keymap_set("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "]e", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "]w", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "[i", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "]i", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "[h", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "]h", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT, float =
    { border = "rounded" } })
  end)
  keymap_set("n", "<space>q", vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      keymap_set("n", "gD", vim.lsp.buf.declaration, opts)
      keymap_set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      keymap_set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      keymap_set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      keymap_set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      keymap_set("n", "<space>rn", vim.lsp.buf.rename, opts)
      keymap_set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      keymap_set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end,
  })
end

Gonvim.opts = {
  lsp_cfg = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
  lsp_on_attach = custom_on_attach,
}

return Gonvim
