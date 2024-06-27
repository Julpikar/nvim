local is_picking_focus = require("cokeline.mappings").is_picking_focus
local is_picking_close = require("cokeline.mappings").is_picking_close

local Cokeline = {}

local function bufferline_setup()
  local inactive_fg = "#859289"
  local fg = "#d3c6aa"
  local inactive_bg = "#1e2326"
  local bg = "#272e33"
  local error = "#e67e80"
  local warn = "#dbbc7f"

  local function border_fg(buffer)
    return buffer.is_focused and "#a7c080" or error
  end

  local config = {
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and fg or inactive_fg
      end,
      bg = function(buffer)
        return buffer.is_focused and bg or inactive_bg
      end,
    },
    components = {
      {
        text = "▎",
        fg = border_fg,
      },
      {
        text = function(buffer)
          if is_picking_focus() or is_picking_close() then
            return buffer.pick_letter .. " "
          end
          if buffer.diagnostics.errors ~= 0 then
            return " "
          end
          if buffer.diagnostics.warnings ~= 0 then
            return " "
          end
          return buffer.devicon.icon
        end,
        fg = function(buffer)
          if buffer.diagnostics.errors ~= 0 or is_picking_close() then
            return error
          end
          if buffer.diagnostics.warnings ~= 0 or is_picking_focus() then
            return warn
          end
          return buffer.is_focused and buffer.devicon.color
        end,
      },
      {
        text = "▊",
        fg = function(buffer)
          return buffer.is_focused and bg or inactive_bg
        end,
      },
      {
        text = function(buffer)
          return buffer.filename .. " "
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
          return buffer.is_focused and "" or "▊"
        end,
        fg = function(buffer)
          return buffer.is_focused and "#e67e80" or inactive_bg
        end,
      },
      {
        text = "▊",
        fg = function(buffer)
          return buffer.is_focused and bg or inactive_bg
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
        fg = function(buffer)
          return buffer.is_focused and "#a7c080" or inactive_fg
        end,
        delete_buffer_on_left_click = true,
      },
      {
        text = "▊",
        fg = function(buffer)
          return buffer.is_focused and bg or inactive_bg
        end,
      },
    },
  }
  require("cokeline").setup(config)
end

local function mappings()
  vim.keymap.set("n", "<leader>bp", function()
    require("cokeline.mappings").pick("focus")
  end, { desc = "Pick a buffer to focus" })

  vim.keymap.set("n", "<leader>bx", function()
    require("cokeline.mappings").pick("close")
  end, { desc = "Pick a buffer to close" })
end

function Cokeline.config()
  bufferline_setup()
  mappings()
end

return Cokeline
