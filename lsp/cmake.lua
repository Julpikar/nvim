local Cmake = {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_markers = { "out", "cmake", ".git" },
  init_options = {
    buildDirectory = "out",
  },
}

return Cmake
