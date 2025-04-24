local Fzf = {
  "ibhagwan/fzf-lua",
  opts = {},
}

Fzf.keys = {
  {
    "<leader>ff",
    mode = "n",
    function()
      require("fzf-lua").files()
    end,
    desc = "FZF: Find Files",
  },
  {
    "<leader>fg",
    mode = "n",
    function()
      require("fzf-lua").git_files()
    end,
    desc = "FZF: Find Git Files",
  },
  {
    "<leader>fb",
    mode = "n",
    function()
      require("fzf-lua").buffers()
    end,
    desc = "FZF: Buffers",
  },
  {
    "<leader>fl",
    mode = "n",
    function()
      require("fzf-lua").live_grep()
    end,
    desc = "FZF: Live Grep",
  },
  {
    "<leader>fh",
    mode = "n",
    function()
      require("fzf-lua").help_tags()
    end,
    desc = "FZF: Help Tags",
  },
  {
    "<leader>fk",
    mode = "n",
    function()
      require("fzf-lua").keymaps()
    end,
    desc = "FZF: Keymaps",
  },
  {
    "<leader>fc",
    mode = "n",
    function()
      require("fzf-lua").commands()
    end,
    desc = "FZF: Commands",
  },
  {
    "<leader>fr",
    mode = "n",
    function()
      require("fzf-lua").oldfiles()
    end,
    desc = "FZF: Recent Files",
  },
  {
    "<leader>fw",
    mode = "n",
    function()
      require("fzf-lua").grep_cword()
    end,
    desc = "FZF: Grep Word",
  },
  {
    "<leader>fx",
    mode = "n",
    function()
      require("fzf-lua").diagnostics_document()
    end,
    desc = "FZF: Buffer Diagnostics",
  },
  {
    "<leader>fX",
    mode = "n",
    function()
      require("fzf-lua").diagnostics_workspace()
    end,
    desc = "FZF: Buffer Diagnostics",
  },
  {
    "<leader>fs",
    mode = "n",
    function()
      require("fzf-lua").lsp_document_symbols()
    end,
    desc = "FZF: Document Symbols",
  },
  {
    "<leader>fS",
    mode = "n",
    function()
      require("fzf-lua").lsp_document_workspace()
    end,
    desc = "FZF: Document Symbols",
  },
}

return Fzf
