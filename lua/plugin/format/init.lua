local Format = {}

function Format.keymap()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F10>", ":Format<CR>", {noremap = true, silent = true})
  remap("v", "<F10>", ":Format<CR>", {noremap = true, silent = true})
end

function Format.config()
  local formatter = require "formatter"
  local formatter_config = {}

  formatter_config["blade"] = {
    function()
      return {
        exe = "blade-formatter",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  }

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

  formatter_config["css"] = {
    function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
        stdin = true
      }
    end
  }

  formatter_config["html"] = {
    function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
        stdin = true
      }
    end
  }

  formatter_config["javascript"] = {
    function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
        stdin = true
      }
    end
  }

  formatter_config["json"] = {
    function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
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
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
        stdin = true
      }
    end
  }

  formatter_config["python"] = {
    function()
      return {
        exe = "black",
        args = {vim.api.nvim_buf_get_name(0)},
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
end

return Format
