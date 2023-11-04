local custom_on_attach = require("lsp_signature").on_attach
local custom_capabilities = require("cmp_nvim_lsp").default_capabilities

local lspconfig = require("lspconfig")

local LSPConfig = {}

local function custom_server()
  -- C++
  lspconfig.clangd.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities(),
    on_new_config = function(new_config, new_cwd)
      local status, cmake = pcall(require, "cmake-tools")
      if status then
        cmake.clangd_on_new_config(new_config)
      end
    end,
  })

  -- CMake
  lspconfig.cmake.setup({ on_attach = custom_on_attach, capabilities = custom_capabilities() })

  -- Lua
  lspconfig.lua_ls.setup({
    on_attach = custom_on_attach,
    capabilities = custom_capabilities(),
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
  keymap_set("n", "[d", vim.diagnostic.goto_prev)
  keymap_set("n", "]d", vim.diagnostic.goto_next)
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
      keymap_set("n", "K", vim.lsp.buf.hover, opts)
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

local function notify()
  -- Utility functions shared between progress reports for LSP and DAP
  local client_notifs = {}

  local function get_notif_data(client_id, token)
    if not client_notifs[client_id] then
      client_notifs[client_id] = {}
    end

    if not client_notifs[client_id][token] then
      client_notifs[client_id][token] = {}
    end

    return client_notifs[client_id][token]
  end

  local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

  local function update_spinner(client_id, token)
    local notif_data = get_notif_data(client_id, token)

    if notif_data.spinner then
      local new_spinner = (notif_data.spinner + 1) % #spinner_frames
      notif_data.spinner = new_spinner

      notif_data.notification = vim.notify("", nil, {
        hide_from_history = true,
        icon = spinner_frames[new_spinner],
        replace = notif_data.notification,
      })

      vim.defer_fn(function()
        update_spinner(client_id, token)
      end, 100)
    end
  end

  local function format_title(title, client_name)
    return client_name .. (#title > 0 and ": " .. title or "")
  end

  local function format_message(message, percentage)
    return (percentage and percentage .. "%\t" or "") .. (message or "")
  end

  -- LSP integration
  -- Make sure to also have the snippet with the common helper functions in your config!

  vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    local client_id = ctx.client_id

    local val = result.value

    if not val.kind then
      return
    end

    local notif_data = get_notif_data(client_id, result.token)

    if val.kind == "begin" then
      local message = format_message(val.message, val.percentage)
      notif_data.notification = vim.notify(message, vim.log.levels.INFO, {
        title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
        icon = spinner_frames[1],
        timeout = false,
        hide_from_history = false,
      })
      notif_data.spinner = 1
      update_spinner(client_id, result.token)
    elseif val.kind == "report" and notif_data then
      notif_data.notification = vim.notify(format_message(val.message, val.percentage), vim.log.levels.INFO, {
        replace = notif_data.notification,
        hide_from_history = false,
      })
    elseif val.kind == "end" and notif_data then
      notif_data.notification =
        vim.notify(val.message and format_message(val.message) or "Complete", vim.log.levels.INFO, {
          icon = "",
          replace = notif_data.notification,
          timeout = 3000,
        })

      notif_data.spinner = nil
    end
  end
end

local function diagnostic_signs()
  vim.fn.sign_define("DiagnosticSignError", { text = "E󰁕", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = "W󰁕", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = "I󰁕", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "H󰁕", texthl = "DiagnosticSignHint" })
end

function LSPConfig.config()
  custom_server()
  lsp_mapping()
  diagnostic_signs()
  notify()
end

return LSPConfig
