local Root = {}

local configs = {
  patterns = { ".git", "Makefile", "package.json", "CMakeLists.txt" },
}

local function find_lsp_root()
  -- Get lsp client for current buffer
  -- Returns nil or string
  local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return nil
  end
  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.tbl_contains(filetypes, buf_ft) then
      return client.config.root_dir, client.name
    end
  end

  return nil
end

local function find_pattern_root()
  for _, pattern in ipairs(configs.patterns) do
    local bufnr = vim.api.nvim_get_current_buf()
    local root = vim.fs.root(bufnr, pattern)
    if root ~= nil then
      return root, pattern
    end
  end
  return vim.fn.expand("%:p:h"), "filename"
end

local function set_pwd(dir, method)
  if dir ~= nil then
    local norm_dir = vim.uv.fs_realpath(dir)
    local norm_cwd = vim.uv.fs_realpath(vim.uv.cwd())
    if norm_cwd:lower() ~= norm_dir:lower() then
      vim.api.nvim_set_current_dir(norm_dir)
      vim.notify("Set CWD from " .. norm_cwd .. " to " .. dir .. " using " .. method)
      return
    end
  end
end

function Root.setup()
  vim.api.nvim_create_augroup("FindRoot", { clear = false })
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = "FindRoot",
    pattern = "*",
    callback = function()
      local root, method = find_pattern_root()
      set_pwd(root, method)
    end,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = "FindRoot",
    pattern = "*",
    callback = function()
      local root, method = find_lsp_root()
      set_pwd(root, method)
    end,
  })
end

return Root
