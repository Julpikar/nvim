local Clangd = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { "utf-8", "utf-16" },
  },
  commands = {
    ClangdSwitchSourceHeader = {
      function()
        local method_name = "textDocument/switchSourceHeader"
        local bufnr = vim.api.nvim_get_current_buf()
        local client = vim.lsp.get_clients(bufnr, "clangd")
        if not client then
          return vim.notify(
            ("method %s is not supported by any servers active on the current buffer"):format(method_name)
          )
        end
        local params = vim.lsp.util.make_text_document_params(bufnr)
        client.request(method_name, params, function(err, result)
          if err then
            error(tostring(err))
          end
          if not result then
            vim.notify("corresponding file cannot be determined")
            return
          end
          vim.cmd.edit(vim.uri_to_fname(result))
        end, bufnr)
      end,
      description = "Switch between source/header",
    },
    ClangdShowSymbolInfo = {
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        local client = vim.api.get_clients(bufnr, "clangd")
        if not client or not client.supports_method("textDocument/symbolInfo") then
          return vim.notify("Clangd client not found", vim.log.levels.ERROR)
        end
        local win = vim.api.nvim_get_current_win()
        local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
        client.request("textDocument/symbolInfo", params, function(err, res)
          if err or #res == 0 then
            -- Clangd always returns an error, there is not reason to parse it
            return
          end
          local container = string.format("container: %s", res[1].containerName) ---@type string
          local name = string.format("name: %s", res[1].name) ---@type string
          vim.lsp.util.open_floating_preview({ name, container }, "", {
            height = 2,
            width = math.max(string.len(name), string.len(container)),
            focusable = false,
            focus = false,
            border = "single",
            title = "Symbol Info",
          })
        end, bufnr)
      end,
      description = "Show symbol info",
    },
  },
}

return Clangd
