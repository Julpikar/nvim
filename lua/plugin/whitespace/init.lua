local Whitespace = {}

function Whitespace.config()
  vim.g.better_whitespace_filetypes_blacklist = { "dashboard", "packer", "Trouble" }
end

return Whitespace
