local Session = {}

function Session.config()
  local opts = {
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = {}
  }

  require("auto-session").setup(opts)
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Session})
    return self
  end
}
setmetatable(Session, metatable)

return Session
