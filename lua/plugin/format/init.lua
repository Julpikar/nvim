local Format = {}

local function set_keymap()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F10>", ":Format<CR>", {noremap = true, silent = true})
  remap("v", "<F10>", ":Format<CR>", {noremap = true, silent = true})
end

function Format.config()
  local formatter = require "formatter"
  local formatter_config = {}

  formatter_config["c"] = {
    function()
      return {
        exe = "clang-format",
        args = {"--style=LLVM"},
        stdin = true
      }
    end
  }

  formatter_config["cpp"] = {
    function()
      return {
        exe = "clang-format",
        args = {"--style=LLVM"},
        stdin = true
      }
    end
  }

  formatter_config["lua"] = {
    function()
      return {
        exe = "luafmt",
        args = {"--indent-count", 2, "--stdin"},
        stdin = true
      }
    end
  }

  formatter_config["php"] = {
    function()
      return {
        exe = "phpcbf",
        args = {"--standard=psr12"},
        stdin = false
      }
    end
  }

  formatter_config["rust"] = {
    function()
      return {
        exe = "rustfmt",
        args = {"--emit=stdout"},
        stdin = true
      }
    end
  }

  formatter.setup({logging = false, filetype = formatter_config})
  set_keymap()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Format})
    return self
  end
}
setmetatable(Format, metatable)

return Format
