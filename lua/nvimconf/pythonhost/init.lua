local M = {}

function M.init()
  vim.g.python_host_skip_check = 1
  vim.g.python2_host_skip_check = 1
  vim.g.python3_host_skip_check = 1
  vim.g.python3_host_prog = "C:/tools/miniconda3/python.exe"
end

return M
