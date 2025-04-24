local Cokeline = {
  "willothy/nvim-cokeline",
}

Cokeline.init = function()
  local nvim_set_keymap = vim.api.nvim_set_keymap
  nvim_set_keymap("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true, desc = "Cokeline: Previous Focus" })
  nvim_set_keymap("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true, desc = "Cokeline: Next Focus" })
  nvim_set_keymap("n", "<leader>bp", "<Plug>(cokeline-pick-focus)", { silent = true, desc = "Cokeline: Buffer Picker" })
end

local color = {
  fg_focused = "#d3c6aa",
  fg_unfocused = "#7a8478",
  bg_focused = "#272e33",
  bg_unfocused = "#323d43",
  red = "#e67e80",
  yellow = "#dbbc7f",
  blue = "#7fbbb3",
}

Cokeline.opts = {
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and color.fg_focused or color.fg_unfocused
    end,
    bg = function(buffer)
      return buffer.is_focused and color.bg_focused or color.bg_unfocused
    end,
  },
  components = {
    {
      text = function(buffer)
        return (buffer.index ~= 1) and "▏" or ""
      end,
      fg = function(buffer)
        return buffer.is_focused and color.fg_focused or color.fg_unfocused
      end,
    },
    {
      text = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus or is_picking_close) and (" " .. buffer.pick_letter) or ""
      end,
      fg = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus and color.yellow) or (is_picking_close and color.red)
      end,
      italic = function()
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus or is_picking_close)
      end,
      bold = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus or is_picking_close)
      end,
    },
    {
      text = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus or is_picking_close) and (buffer.filename:sub(#buffer.pick_letter + 1) .. " ")
          or " " .. buffer.filename .. " "
      end,
      fg = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus and color.fg_unfocused) or (is_picking_close and color.fg_focused)
      end,
      italic = function()
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus or is_picking_close)
      end,
      bold = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return not (is_picking_focus or is_picking_close) and buffer.is_focused
      end,
    },
    {
      text = " ",
      fg = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus and color.fg_unfocused)
          or (is_picking_close and color.blue)
          or (buffer.is_focused and color.blue or color.fg_unfocused)
      end,
      on_click = function(_, _, _, _, buffer)
        buffer:delete()
      end,
    },
    {
      text = " ",
    },
  },
}

return Cokeline
