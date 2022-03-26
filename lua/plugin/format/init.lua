local Format = {}

function Format.keymap()
  vim.keymap.set({"n", "v"}, "<F10>", "<CMD>Format<CR>", {noremap = true, silent = true})

  local format_augroup = vim.api.nvim_create_augroup("FormatAutogroup", {clear = true})
  vim.api.nvim_create_autocmd(
    "BufWritePost",
    {command = "FormatWrite", pattern = "*.js,*.py,*.rs,*.lua", group = format_augroup}
  )
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
        args = {"--stdin-filename", vim.api.nvim_buf_get_name(0)},
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
