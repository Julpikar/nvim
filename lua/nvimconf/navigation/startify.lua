-- startify
vim.g.startify_lists = {
  {type = "files", header = {"   Files"}},
  {type = "dir", header = {"   Current Directory " .. vim.fn.getcwd()}},
  {type = "sessions", header = {"   Sessions"}},
  {type = "bookmarks", header = {"   Bookmarks"}}
}

vim.g.startify_bookmarks = {
  { = "D:\\sources"},
  { = "~\\AppData\\Local\\nvim\\init.lua"},
  { = "~\\AppData\\Local\\nvim-data\\site\\pack\\packer"}
}

vim.g.startify_session_delete_buffers = 0
vim.g.startify_session_persistence = 1
