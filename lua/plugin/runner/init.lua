local Runner = {}

function Runner.config()
  require("code_runner").setup({
    term = {
      mode = "startinsert",
      tab = false,
      position = "belowright",
      size = 8,
    },
    filetype = { python = "python -u" },
  })
end

return Runner
