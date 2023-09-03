local Formatter = {}

function Formatter.config()
  -- Utilities for creating configurations
  local util = require("formatter.util")

  -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
  require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
      c = { require("formatter.filetypes.cpp").clangformat },
      cpp = { require("formatter.filetypes.cpp").clangformat },
      cmake = { require("formatter.filetypes.cmake").cmakeformat },
      go = { require("formatter.filetypes.go").gofmt },
      json = { require("formatter.filetypes.json").prettier },
      lua = {
        -- "formatter.filetypes.lua" defines default configurations for the
        -- "lua" filetype
        require("formatter.filetypes.lua").stylua,

        -- You can also define your own configuration
        function()
          -- Supports conditional formatting
          if util.get_current_buffer_file_name() == "special.lua" then
            return nil
          end

          -- Full specification of configurations is down below and in Vim help
          -- files
          return {
            exe = "stylua",
            args = {
              "--search-parent-directories",
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
              "--",
              "-",
            },
            stdin = true,
          }
        end,
      },
    },
  })
end

return Formatter
