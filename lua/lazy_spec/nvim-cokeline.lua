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
  bg_base = "#2e383c",
  bg_space = "#272e33",
  fg_focused = "#d3c6aa",
  fg_unfocused = "#9da9a0",
  bg_focused = "#475258",
  bg_unfocused = "#414b50",
  picking_close = "#e69875",
  picking_focus = "#dbbc7f",
}

local mode = vim.fn.mode

local color_mode = {
  ["n"] = { "#e69875", "#475258" },
  ["v"] = { "#d699b6", "#475258" },
  ["V"] = { "#d699b6", "#475258" },
  ["i"] = { "#7fbbb3", "#475258" },
  ["r"] = { "#e67e80", "#475258" },
  ["R"] = { "#e67e80", "#475258" },
  ["t"] = { "#dbbc7f", "#475258" },
}

Cokeline.opts = {
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and color.fg_focused or color.fg_unfocused
    end,
    bg = function(buffer)
      local c = color_mode[mode()]
      return (buffer.is_focused and c ~= nil) and color.bg_focused or color.bg_unfocused
    end,
  },
  components = {
    {
      text = function(buffer)
        return buffer.is_first and "" or ""
      end,
      fg = color.bg_unfocused,
      bg = color.bg_space,
    },
    {
      text = "",
      fg = function(buffer)
        local c = color_mode[mode()]
        return (buffer.is_focused and c ~= nil) and c[1] or color.fg_unfocused
      end,
      bg = color.bg_base,
    },
    {
      text = function(buffer)
        return buffer.is_hovered and "  " or " " .. buffer.devicon.icon .. " "
      end,
      fg = color.bg_space,
      bg = function(buffer)
        local c = color_mode[mode()]
        return (buffer.is_focused and c ~= nil) and c[1] or color.fg_unfocused
      end,
      on_click = function(_, _, _, _, buffer)
        buffer:delete()
      end,
    },
    {
      text = "",
      fg = function(buffer)
        local c = color_mode[mode()]
        return (buffer.is_focused and c ~= nil) and c[1] or color.fg_unfocused
      end,
    },
    {
      text = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus or is_picking_close) and " " .. buffer.pick_letter or ""
      end,
      fg = function(buffer)
        local mappings = require("cokeline.mappings")
        local is_picking_focus = mappings.is_picking_focus()
        local is_picking_close = mappings.is_picking_close()
        return (is_picking_focus and color.picking_focus) or (is_picking_close and color.picking_close)
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
        return (is_picking_focus or is_picking_close) and (" " .. buffer.filename:sub(#buffer.pick_letter + 1) .. " ")
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
      text = "",
      fg = function(buffer)
        local c = color_mode[mode()]
        return (buffer.is_focused and c ~= nil) and color.bg_focused or color.bg_unfocused
      end,
      bg = color.bg_base,
    },
  },
  tabs = {
    placement = "right",
    components = {
      {
        text = "",
        fg = function(tabpage)
          local c = color_mode[mode()]
          return (tabpage.is_active and c ~= nil) and c[1] or color.fg_unfocused
        end,
        bg = color.bg_base,
      },
      {
        text = function(tabpage)
          return " " .. tabpage.number .. " "
        end,
        fg = color.bg_space,
        bg = function(tabpage)
          local c = color_mode[mode()]
          return (tabpage.is_active and c ~= nil) and c[1] or color.fg_unfocused
        end,
      },
      {
        text = "",
        fg = function(tabpage)
          local c = color_mode[mode()]
          return (tabpage.is_active and c ~= nil) and c[1] or color.fg_unfocused
        end,
        bg = color.bg_focused,
      },
      {
        text = function(tabpage)
          return tabpage.is_last and "   " or ""
        end,
        fg = function(tabpage)
          local c = color_mode[mode()]
          return c ~= nil and c[1] or color.fg_unfocused
        end,
        bg = color.bg_focused,
      },
    },
  },
}

return Cokeline
