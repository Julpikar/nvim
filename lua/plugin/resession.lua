local resession = require("resession")
local Resession = {}

local function mappings()
  -- Resession does NOTHING automagically, so we have to set up some keymaps
  vim.keymap.set("n", "<leader>ss", resession.save)
  vim.keymap.set("n", "<leader>sl", resession.load)
  vim.keymap.set("n", "<leader>sd", resession.delete)
end

local function load_and_save_session()
  -- Load a dir-specific session when you open Neovim, save it when you exit.
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Only load the session if nvim was started with no args
      if vim.fn.argc(-1) == 0 then
        resession.load("last")
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
