local Treesitter = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "VeryLazy",
}

Treesitter.config = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype.
      -- (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include
      -- `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow
      -- treesitter highlight for large files
      disable = function(lang, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 1000
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the
      -- same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like
      -- for indentation).
      -- Using this option may slow down your editor, and you may see some
      -- duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["gj"] = "@function.outer",
          ["]]"] = "@class.outer",
          ["]b"] = "@block.outer",
          ["]a"] = "@parameter.inner",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["gJ"] = "@function.outer",
          ["]["] = "@class.outer",
          ["]B"] = "@block.outer",
          ["]A"] = "@parameter.inner",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["gk"] = "@function.outer",
          ["[["] = "@class.outer",
          ["[b"] = "@block.outer",
          ["[a"] = "@parameter.inner",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["gK"] = "@function.outer",
          ["[]"] = "@class.outer",
          ["[B"] = "@block.outer",
          ["[A"] = "@parameter.inner",
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.outer",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
    },
  })
end

return Treesitter
