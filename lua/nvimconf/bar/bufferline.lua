-- Bufferline
vim.cmd("autocmd BufAdd,BufEnter * if len(getbufinfo({'buflisted':1})) > 0 | set showtabline=2 | endif")
vim.cmd("autocmd VimEnter * set showtabline=1")

require "bufferline".setup {
  options = {
    view = "multiwindow",
    numbers = "none",
    number_style = "",
    mappings = true,
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    show_buffer_close_icons = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = "directory"
  }
}
