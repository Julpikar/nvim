local Easyalign = {}

function Easyalign.keymap()
  local remap = vim.api.nvim_set_keymap
  -- Start interactive EasyAlign in visual mode (e.g. vipga)
  remap("x", "ga", "<Plug>(EasyAlign)", {silent = true})

  -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
  remap("n", "ga", "<Plug>(EasyAlign)", {silent = true})
end

return Easyalign
