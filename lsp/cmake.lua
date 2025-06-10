local Cmake = {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_markers = { "cmake", "out" },
  init_options = {
    buildDirectory = "out",
  },
}

return Cmake
