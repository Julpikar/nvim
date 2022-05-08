local Bufferline = {}

function Bufferline.config()
  require("bufferline").setup({
    options = {
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match("%.md") then
          return vim.fn.fnamemodify(buf.name, ":t:r")
        end
      end,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      diagnostics = false,
      offsets = {
        { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "center" },
      },
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "thick",
      sort_by = "relative_directory",
    },
  })
end

return Bufferline
