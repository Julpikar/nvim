require "nvimconf/plugin"
require "nvimconf/bar"
require "nvimconf/lsp"
require "nvimconf/navigation"

local namespace = "nvimconf"
local configs = {
  "editor",
  "appearance",
  "git",
  "mapper",
  "formatter",
  "project",
  "treesitter",
  "terminal",
  "pythonhost"
}
for _, config in pairs(configs) do
  local conf = require(namespace .. "/" .. config)
  if pcall(conf.init) then
  else
    print("error at " .. config .. ".lua")
  end
end
