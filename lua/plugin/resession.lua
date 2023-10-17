local resession = require("resession")
local Resession = {}

local function mappings()
  local save_dir = function()
    local session_name = vim.fn.getcwd():gsub(":", ""):gsub("\\", "#")
    resession.save(session_name, { dir = "session", notify = false })
    print("Session save at " .. session_name)
  end
  -- Resession does NOTHING automagically, so we have to set up some keymaps
  vim.keymap.set("n", "<leader>ss", save_dir)
  vim.keymap.set("n", "<leader>sl", resession.load)
  vim.keymap.set("n", "<leader>sd", resession.delete)
end

local function load_and_save_session()
  -- Load a dir-specific session when you open Neovim, save it when you exit.
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Only load the session if nvim was started with no args
      if vim.fn.argc(-1) == 0 then
        local dir = vim.fn.stdpath("data") .. "\\session"
        local session_name = vim.fn.getcwd():gsub(":", ""):gsub("\\", "#")
        local found = vim.fs.find(session_name .. ".json", { path = dir })
        if not next(found) == nil then
          resession.load(session_name, { dir = "session", silence_errors = true })
          print(session_name .. " has loaded")
        end
        vim.ui.input({ prompt = "Load last session?(y/N) " }, function(input)
          if input == "y" then
            resession.load("last")
            print("Last session has loaded")
          end
        end)
      end
    end,
  })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      resession.save("last")
    end,
  })
end

function Resession.config()
  resession.setup()
  load_and_save_session()
  mappings()
end

return Resession
