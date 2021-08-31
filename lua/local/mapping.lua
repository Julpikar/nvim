local opts = {noremap = true, silent = true}

local keymaps = {
  navigate = {
    {"n", "A", "<CMD>wincmd h<CR>", opts},
    {"n", "W", "<CMD>wincmd k<CR>", opts},
    {"n", "D", "<CMD>wincmd l<CR>", opts},
    {"n", "S", "<CMD>wincmd j<CR>", opts},
    {"n", "Z", "<CMD>wincmd p<CR>", opts}
  }
}

local Mapping = {}

function Mapping.setup()
  for _, group in pairs(keymaps) do
    for _, keymap in pairs(group) do
      vim.api.nvim_set_keymap(unpack(keymap))
    end
  end
end

return Mapping
