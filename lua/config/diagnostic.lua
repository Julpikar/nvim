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
keymap_set("n", "<Leader>e", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Diagnostic: Open Diagnostic" })

keymap_set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Backward" })

keymap_set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Forward" })

keymap_set("n", "[e", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Error Backward" })

keymap_set("n", "]e", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Error Forward" })

keymap_set("n", "[w", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Warning Backward" })

keymap_set("n", "]w", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Warning Forward" })

keymap_set("n", "[i", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.INFO, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Info Backward" })

keymap_set("n", "]i", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.INFO, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Info Forward" })

keymap_set("n", "[h", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.HINT, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Hint Backward" })

keymap_set("n", "]h", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.HINT, float = { border = "rounded" } })
end, { desc = "Diagnostic: Jump Hint Forward" })

keymap_set("n", "<SPACE>q", vim.diagnostic.setloclist, { desc = "Toggle Location List" })

keymap_set("n", "<Leader>dv", function()
  local current = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = not current })
end, { desc = "Diagnostic: Toggle Virtual Lines" })
