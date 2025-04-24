local function keymap_set(keys)
  for _, key in pairs(keys) do
    vim.keymap.set(unpack(key))
  end
end

-- Window navigation
local win_navigation = {
  { "n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Jump Left Window" } },
  { "n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Jump Down Window" } },
  { "n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Jump Up Window" } },
  { "n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Jump Right Window" } },
  { "n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Window Vertical Split" } },
  { "n", "<leader>sh", "<cmd>split<cr>", { desc = "Window Horizontal Split" } },
  { "n", "<leader>sc", "<cmd>close<cr>", { desc = "Window Close" } },
}

keymap_set(win_navigation)

-- Save and quit
local save_quit = {
  { "n", "<leader>w", "<cmd>write<cr>", { desc = "Save" } },
  { "n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" } },
}

keymap_set(save_quit)

-- Copy and paste
local copy = {
  { "n", "<leader>y", '"+y', { desc = "Yank To System Clipboard" } },
  { "n", "<leader>Y", '"+Y', { desc = "Yank Linewise To System Clipboard" } },
  { "n", "<leader>p", '"+p', { desc = "Paste After Cursor From System Clipboard" } },
  { "n", "<leader>P", '"+P', { desc = "Paste Before Cursor From System Clipboard" } },
  { "v", "<leader>p", '"_dP', { desc = "Paste Without Yanking" } },
  { "n", "<leader>d", '"_d', { desc = "Delete Without Yanking" } },
  { "n", "<leader>D", '"_D', { desc = "Delete Linewise Without Yanking" } },
  { "n", "<leader>c", '"_c', { desc = "Change Without Yanking" } },
  { "n", "<leader>C", '"_C', { desc = "Change Linewise Without Yanking" } },
}

keymap_set(copy)

-- Buffer
local buffer = {
  { "n", "<leader><leader>", "<C-6>", { desc = "Goto Last Opened Buffer" } },
  { "n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Buffer Close" } },
  {
    "n",
    "<leader>bx",
    function()
      local current = vim.api.nvim_get_current_buf()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) and bufnr ~= current then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
    end,
    { desc = "Buffer Close Other" },
  },
}

keymap_set(buffer)

local search = {
  { "n", "<SPACE><SPACE>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" } },
}

keymap_set(search)
