local LSP = {}

local function get_configs_by_ft(ft)
  local configs = vim.lsp.config
  local matching_configs = {}

  for _, config in pairs(configs) do
    for lsp, _ in pairs(config) do
      local lsp_config = vim.lsp.config[lsp]
      local filetypes = lsp_config.filetypes
      for _, filetype in ipairs(filetypes) do
        if ft == filetype then
          table.insert(matching_configs, lsp_config)
        end
      end
    end
  end
  return matching_configs
end

local function start_lsp_by_ft(ft)
  local configs = get_configs_by_ft(ft)
  for _, config in ipairs(configs) do
    vim.lsp.start(config)
  end
end

function LSP.setup()
  local custom_capabilities = vim.tbl_deep_extend("force", require("cmp_nvim_lsp").default_capabilities(), {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  })

  vim.lsp.config("*", {
    capabilities = custom_capabilities,
    root_markers = { ".git" },
  })

  vim.lsp.enable({ "basedpyright", "clangd", "luals", "neocmake", "yamlls" })

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
  end)

  keymap_set("n", "=x", function()
    local bufnr = vim.api.nvim_get_current_buf()

    vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = bufnr }))
    vim.notify("LSP has stopped for filetype " .. vim.bo.filetype)
  end)
end

return LSP
