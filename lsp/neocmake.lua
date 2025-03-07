local NeoCmake = {
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake" },
  root_markers = { "build", "cmake", ".git" },
}

return NeoCmake
