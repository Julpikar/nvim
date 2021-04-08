local Bufferline = {}

function Bufferline.config()
  require "bufferline".setup {
    options = {
      view = "multiwindow",
      numbers = "none",
      number_style = "", -- buffer_id at index 1, ordinal at index 2
      mappings = true,
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is deduplicated
      tab_size = 18,
      diagnostics = false,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thick",
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      sort_by = "directory"
    }
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Bufferline})
    return self
  end
}
setmetatable(Bufferline, metatable)

return Bufferline
