local M = {}

function M.init()
  vim.g.rooter_patterns = {".git", "Makefile", "*.sln", "build/env.sh"}
end

return M
