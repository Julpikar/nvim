local Diagnostic = {}

function Diagnostic.setup()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "E→",
        [vim.diagnostic.severity.WARN] = "W→",
        [vim.diagnostic.severity.INFO] = "I→",
        [vim.diagnostic.severity.HINT] = "H→",
      },
    },
    float = { border = "rounded" },
  })

  local keymap_set = vim.keymap.set
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below
  -- functions
  keymap_set("n", "<space>e", function()
    vim.diagnostic.open_float({ border = "rounded" })
  end)
  keymap_set("n", "[d", function()
    vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
  end)
  keymap_set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
  end)
  keymap_set("n", "[e", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = { border = "rounded" } })
  end)
  keymap_set("n", "]e", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = { border = "rounded" } })
  end)
  keymap_set("n", "[w", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = { border = "rounded" } })
  end)
  keymap_set("n", "]w", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = { border = "rounded" } })
  end)
  keymap_set("n", "[i", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.INFO, float = { border = "rounded" } })
  end)
  keymap_set("n", "]i", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.INFO, float = { border = "rounded" } })
  end)
  keymap_set("n", "[h", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.HINT, float = { border = "rounded" } })
  end)
  keymap_set("n", "]h", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.HINT, float = { border = "rounded" } })
  end)
  keymap_set("n", "<space>q", vim.diagnostic.setloclist)
end

return Diagnostic
