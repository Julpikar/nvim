local Resession = {
  "stevearc/resession.nvim",
}

Resession.keys = {
  {
    "<leader>ss",
    function()
      local resession = require("resession")
      local session_name = vim.fn.getcwd():gsub(":", ""):gsub("\\", "#")
      resession.save(session_name, { dir = "session", notify = false })
      vim.notify("Session save at " .. session_name, vim.log.levels.INFO, {
        title = "resession.nvim",
        icon = "",
      })
    end,
  },
  {
    "<leader>sl",
    function()
      require("resession").load()
    end,
  },
  {
    "<leader>sd",
    function()
      require("resession").delete()
    end,
  },
}

local function find_session_dir(session_name)
  local dir = vim.fn.stdpath("data") .. "\\session"
  return vim.fs.find(session_name .. ".json", { path = dir })
end

Resession.init = function()
  local resession = require("resession")

  resession.setup()

  -- Automatic load and save session
  -- Load a dir-specific session when you open Neovim, save it when you exit.
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Only load the session if nvim was started with no args
      if vim.fn.argc(-1) == 0 then
        local session_name = vim.fn.getcwd():gsub(":", ""):gsub("\\", "#")
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
      local session_name = vim.fn.getcwd():gsub(":", ""):gsub("\\", "#")
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

return Resession
