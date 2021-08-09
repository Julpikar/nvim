local cmd = vim.cmd

local Utils = {}

function Utils.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd("autocmd!")
    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten({"autocmd", def}), " ")
      vim.cmd(command)
    end
    vim.cmd("augroup END")
  end
end

function Utils.create_augroup(autocmds, name)
  cmd("augroup " .. name)
  cmd("autocmd!")
  for _, autocmd in ipairs(autocmds) do
    cmd("autocmd " .. table.concat(autocmd, " "))
  end
  cmd("augroup END")
end

return Utils
