local lspconfig = require("lspconfig")

local LSPConfig = {}

local function custom_server()
  local custom_capabilities = require("cmp_nvim_lsp").default_capabilities()
  local custom_on_attach = function(client, bufnr)
    local config = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }
    require("lsp_signature").on_attach(config, bufnr)
  end

  -- C++
  lspconfig.clangd.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
  })

  -- CMake
  lspconfig.cmake.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
  })

  -- Lua
  lspconfig.lua_ls.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.uv.fs_stat(path .. "/.luarc.json") and not vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              },
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            },
          },
        })

        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
      return true
    end,
    autostart = false,
  })

  lspconfig.pyright.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
  })

  lspconfig.sqls.setup({
    on_attach = function(client, bufnr)
      custom_on_attach()
      require("sqls").on_attach(client, bufnr)
    end,
    capabilities = custom_capabilities,
    settings = {
      sqls = {
        connections = {
          {
            driver = "sqlite3",
            dataSourceName = "db.sqlite3",
          },
        },
      },
    },
  })

  lspconfig.tsserver.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
  })
end

local function lsp_mapping()
  local keymap_set = vim.keymap.set

  keymap_set("n", "<LEADER>ls", "<CMD>LspStart<CR>")
  keymap_set("n", "<LEADER>lx", "<CMD>LspStop<CR>")
  keymap_set("n", "<LEADER>lr", "<CMD>LspRestart<CR>")

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  keymap_set("n", "<space>e", vim.diagnostic.open_float)
  keymap_set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = { border = "rounded" } })
  end)
  keymap_set("n", "]d", function()
    vim.diagnostic.goto_next({ float = { border = "rounded" } })
  end)
  keymap_set("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = { border = "rounded" } })
  end)
  keymap_set("n", "]e", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = { border = "rounded" } })
  end)
  keymap_set("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, float = { border = "rounded" } })
  end)
  keymap_set("n", "]w", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, float = { border = "rounded" } })
  end)
  keymap_set("n", "[i", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO, float = { border = "rounded" } })
  end)
  keymap_set("n", "]i", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO, float = { border = "rounded" } })
  end)
  keymap_set("n", "[h", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT, float = { border = "rounded" } })
  end)
  keymap_set("n", "]h", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT, float = { border = "rounded" } })
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

local function diagnostic_signs()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "E󰁕",
        [vim.diagnostic.severity.WARN] = "W󰁕",
        [vim.diagnostic.severity.INFO] = "I󰁕",
        [vim.diagnostic.severity.HINT] = "H󰁕",
      },
    },
  })
end

local function lsp_handler()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", width = 120 })
end

function LSPConfig.config()
  custom_server()
  lsp_mapping()
  diagnostic_signs()
  lsp_handler()
end

return LSPConfig
