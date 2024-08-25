local LspConfig = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim", config = true },
  },
  keys = {
    {
      "<LEADER>ls",
      function()
        vim.cmd("LspStart")
        vim.notify("LSP has started for filetype " .. vim.bo.filetype)
      end,
    },
    {
      "<LEADER>lx",
      function()
        vim.cmd("LspStop")
        vim.notify("LSP has stopped for filetype " .. vim.bo.filetype)
      end,
    },
    {
      "<LEADER>lr",
      function()
        vim.cmd("LspRestart")
        vim.notify("LSP has restarted for filetype " .. vim.bo.filetype)
      end,
    },
  },
}

local custom_capabilities = require("cmp_nvim_lsp").default_capabilities()

local function custom_diagnostic()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "E→",
        [vim.diagnostic.severity.WARN] = "W→",
        [vim.diagnostic.severity.INFO] = "I→",
        [vim.diagnostic.severity.HINT] = "H→",
      },
    },
  })
end

local function custom_handlers()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", width = 120 })
end

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
end

local function server_register()
  local lspconfig = require("lspconfig")

  -- LSP setup
  lspconfig.basedpyright.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
    autostart = false,
  })

  -- C++
  lspconfig.clangd.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
    on_new_config = function(new_config, new_cwd)
      local status, cmake = pcall(require, "cmake-tools")
      if status then
        cmake.clangd_on_new_config(new_config)
      end
    end,
    autostart = false,
  })

  -- CMake
  lspconfig.neocmake.setup({
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

  -- Toml
  lspconfig.taplo.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities,
  })
end

LspConfig.init = function()
  local keymap_set = vim.keymap.set

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

LspConfig.config = function()
  custom_handlers()
  custom_diagnostic()
  server_register()
end

return LspConfig
