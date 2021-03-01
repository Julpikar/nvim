local formatter = require "formatter"

Bin_path = "C:/Users/benawas/AppData/Local/nvim/bin/"
local filename = vim.api.nvim_buf_get_name(0)
local formatter_config = {}

formatter_config["lua"] = {
  function()
    return {
      exe = "luafmt",
      args = {"--indent-count", 2, "--stdin"},
      stdin = true
    }
  end
}

formatter_config["python"] = {
  function()
    return {
      exe = "autopep8",
      args = {"--in-place", "--aggressive", "--aggressive", filename},
      stdin = true
    }
  end
}

formatter_config["rust"] = {
  function()
    return {
      exe = "rustfmt",
      args = {"--emit=stdout", stdin = true}
    }
  end
}

formatter.setup({logging = false, filetype = formatter_config})
