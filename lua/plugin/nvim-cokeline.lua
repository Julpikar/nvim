local Cokeline = {}
function Cokeline.config()
  local get_hex = require("cokeline.hlgroups").get_hl_attr
  local fg = "#00060b"
  local inactive_fg = "#d6deeb"
  local bg = "#d6deeb"
  local inactive_bg = "#00060b"
  local error = get_hex("DiagnosticError", "fg")
  local warn = get_hex("DiagnosticWarn", "fg")

  require("cokeline").setup({
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and fg or inactive_fg
      end,
      bg = function(buffer)
        return buffer.is_focused and bg or inactive_bg
      end,
    },
    sidebar = {
      filetype = "NvimTree",
      components = {
        {
          text = " 󰙅  File Explorer ",
          style = "bold",
        },
      },
    },

    components = {
      {
        text = function(buffer)
          if buffer.index == 1 and require("nvim-tree.api").tree.is_visible() then
            return "▎ "
          end
          return ""
        end,
      },
      {
        text = function(buffer)
          return (buffer.index ~= 1) and "▎  " or "   "
        end,
      },
      {
        text = function(buffer)
          if buffer.diagnostics.errors ~= 0 then
            return " "
          end
          if buffer.diagnostics.warnings ~= 0 then
            return " "
          end
          return buffer.devicon.icon
        end,
        fg = function(buffer)
          if buffer.diagnostics.errors ~= 0 then
            return error
          end
          if buffer.diagnostics.warnings ~= 0 then
            return warn
          end
          return buffer.is_focused and buffer.devicon.color
        end,
      },
      {
        text = " ",
      },
      {
        text = function(buffer)
          return buffer.filename .. "  "
        end,
        bold = function(buffer)
          return buffer.is_focused
        end,

        italic = function(buffer)
          return not buffer.is_focused
        end,
      },
      {
        text = function(buffer)
          if buffer.is_readonly then
            return ""
          end
          if buffer.is_modified then
            return "●"
          end
          return ""
        end,
        delete_buffer_on_left_click = true,
      },
      {
        text = "   ",
      },
    },
  })
end
return Cokeline
