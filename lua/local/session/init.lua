local utils = require("utils")
local cmd = vim.cmd
local fn = vim.fn

local config = {
  session_dir = fn.stdpath("data") .. "/sessions/"
}

local function session_name_escape(name)
  if vim.o.shellslash then
    return string.gsub(name, ":/", "__"):gsub("/", "_")
  end
  return string.gsub(name, ":\\", "__"):gsub("\\", "_")
end

local function session_name_unescape(name)
  if vim.o.shellslash then
    return string.gsub(name, "__", ":/"):gsub("_", "/")
  end
  return string.gsub(name, "__", ":\\"):gsub("_", "\\")
end

local function get_session_path(session_name)
  session_name = session_name and session_name or fn.getcwd()
  session_name = session_name_escape(session_name)
  return string.format(config.session_dir .. "/%s.vim", session_name)
end

local Session = {}

function Session.restore_session(session_name)
  local command = "source " .. get_session_path(session_name)
  local success, result = pcall(cmd, command)
  if not success then
    print("session restore error at:", result)
    return
  end
end

function Session.save_session(session_name)
  local command = "mksession! " .. get_session_path(session_name)
  cmd(command)
end

function Session.setup()
  if fn.isdirectory(config.session_dir) == 0 then
    fn.mkdir(config.session_dir)
  end

  local autocmds = {
    {"VimLeave", "*", "lua require('local.session').save_session()"}
  }
  utils.create_augroup(autocmds, "session")
end

return Session
