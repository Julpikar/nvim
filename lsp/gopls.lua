local Gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { "go.mod" },
}

local mod_cache = nil
Gopls.reuse_client = function(client, config)
  if not mod_cache then
    mod_cache = vim.fn.system("go env GOMODCACHE")
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local fname = vim.api.nvim_buf_get_name(bufnr)

  if mod_cache and fname:sub(1, #mod_cache) then
    return true
  else
    return false
  end
end

return Gopls
