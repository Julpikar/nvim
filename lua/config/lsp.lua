local function get_configs_by_ft(ft)
  local rtp_config = {}
  for _, v in ipairs(vim.api.nvim_get_runtime_file("lsp/*.{vim,lua}", true)) do
    local config = assert(loadfile(v))() ---@type any?
    if type(config) == "table" then
      local filetypes = config.filetypes
      if vim.tbl_contains(filetypes, ft) then
        table.insert(rtp_config, config)
      end
    else
      vim.lsp.log.warn(string.format("%s does not return a table, ignoring", v))
    end
  end
  return rtp_config
end

local function start_lsp_by_ft(ft)
  local configs = get_configs_by_ft(ft)
  for _, config in ipairs(configs) do
    vim.lsp.start(config)
  end
end

local custom_capabilities = {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
  },
}

local blink = require("blink.cmp")
local capabilities = blink.get_lsp_capabilities(custom_capabilities)

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

vim.lsp.enable({ "clangd", "gopls", "luals", "neocmake" })

vim.lsp.enable("sqls", {
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
})

local keymap_set = vim.keymap.set

keymap_set("n", "=s", function()
  local ft = vim.bo.filetype
  start_lsp_by_ft(ft)
  vim.notify("LSP has started for filetype " .. ft)
end, { desc = "LSP: Start LSP" })

keymap_set("n", "=x", function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = bufnr }))
  vim.notify("LSP has stopped for filetype " .. vim.bo.filetype)
end, { desc = "LSP: Stop LSP" })
