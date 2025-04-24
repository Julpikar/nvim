local Resession = {
  "stevearc/resession.nvim",
  opts = {},
}

local function find_session_dir(session_name)
  local dir = vim.fn.stdpath("data") .. "\\session"
  return vim.fs.find(session_name .. ".json", { path = dir })
end

local function get_session_name()
  return vim.fn.getcwd():gsub(":", ""):gsub("\\", "#")
end

Resession.init = function()
  -- Automatic load and save session
  -- Load a dir-specific session when you open Neovim, save it when you exit.
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Only load the session if nvim was started with no args
      if vim.fn.argc(-1) == 0 then
        local resession = require("resession")
        local session_name = get_session_name()
        local found = find_session_dir(session_name)
        if next(found) ~= nil then
          resession.load(session_name, { dir = "session", silence_errors = true })
          vim.notify(
            "Session load at " .. session_name,
            vim.log.levels.INFO,
            { title = "resession.nvim", icon = "" }
          )
          return
        end
        vim.ui.input({ prompt = "Load last session?(y/n) " }, function(input)
          if input == "y" then
            resession.load("last")
            vim.notify("Last session has loaded", vim.log.levels.INFO, {
              title = "resession.nvim",
              icon = "",
            })
          end
        end)
      end
    end,
  })

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      local resession = require("resession")
      local session_name = get_session_name()
      local found = find_session_dir(session_name)
      if next(found) ~= nil then
        resession.save(session_name, { dir = "session", notify = false })
        vim.notify("Session Save at " .. session_name, vim.log.levels.INFO, {
          title = "resession.nvim",
          icon = "",
        })
      end
      resession.save("last")
    end,
  })
end

Resession.keys = {
  {
    "<leader>ss",
    function()
      local resession = require("resession")
      local session_name = get_session_name()
      resession.save(session_name, { dir = "session", notify = false })
      vim.notify("Session save at " .. session_name, vim.log.levels.INFO, {
        title = "resession.nvim",
        icon = "",
      })
    end,
    { desc = "Resession: Save Session" },
  },
  {
    "<leader>sl",
    function()
      require("resession").load()
    end,
    { desc = "Resession: Load Session" },
  },
  {
    "<leader>sd",
    function()
      require("resession").delete()
    end,
    { desc = "Resession: Delete Session" },
  },
}

return Resession
