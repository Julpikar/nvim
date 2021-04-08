local g = vim.g

local Dashboard = {}

function Dashboard.config()
  g.dashboard_default_executive = "telescope"
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Dashboard})
    return self
  end
}
setmetatable(Dashboard, metatable)

return Dashboard
