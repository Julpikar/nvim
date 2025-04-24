local Root = {}

local configs = {
  patterns = { ".git", "Makefile", "package.json", "CMakeLists.txt" },
}

function Root.find_lsp_root()
  -- Get lsp client for current buffer
  -- Returns nil or string
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return nil
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.tbl_contains(filetypes, buf_ft) then
      local root_dir = client.config.root_dir
      if root_dir ~= nil then
        return vim.fs.normalize(root_dir), client.name
      else
        return nil
      end
    end
  end

  return nil
end

function Root.find_pattern_root()
  for _, pattern in ipairs(configs.patterns) do
    local bufnr = vim.api.nvim_get_current_buf()
    local root = vim.fs.root(bufnr, pattern)
    if root ~= nil then
      return vim.fs.normalize(root), pattern
    end
  end
  return vim.fs.normalize(vim.fn.expand("%:p:h")), "filename"
end

function Root.set_pwd(dir, method)
  if dir ~= nil and method ~= nil then
    local cwd = vim.fs.normalize(vim.uv.cwd())
    if cwd:lower() ~= dir:lower() then
      vim.api.nvim_set_current_dir(dir)
      vim.notify("Set CWD from " .. cwd .. " to " .. dir .. " using " .. method)
      return
    end
  end
end

return Root
