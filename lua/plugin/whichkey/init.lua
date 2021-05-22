local wk = require("which-key")
local WhichKey = {}

function WhichKey.config()
  vim.cmd [[let mapleader = "\<SPACE>"]]

  wk.setup {
    key_labels = {
      ["<space>"] = "SPC",
      ["<CR>"] = "RET",
      ["<tab>"] = "TAB"
    },
    layout = {
      spacing = 5 -- spacing between columns
    },
    ignore_missing = true
  }

  -- Windows name
  for i = 1, 9, 1 do
    wk.register({["<LEADER>" .. i] = {name = "window-" .. i}})
  end

  wk.register(
    {
      b = {
        name = "buffer",
        d = {"<CMD>bdelete<CR>", "delete-buffer"},
        n = {"<CMD>BufferLineCycleNext<CR>", "next-buffer"},
        m = {"<CMD>bNext<CR>", "next-buffer-force"},
        p = {"<CMD>BufferLineCyclePrev<CR>", "previous-buffer"},
        t = {"<CMD>BufferLinePick<CR>", "select-tab"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      c = {
        name = "kommentary",
        c = {"<Plug>kommentary_line_default", "comment"},
        d = {
          name = "decrease",
          l = {"<Plug>kommentary_line_decrease", "line-decrease"},
          m = {"<Plug>kommentary_motion_decrease", "motion-decrease"}
        },
        i = {
          name = "increase",
          l = {"<Plug>kommentary_line_increase", "line-increase"},
          m = {"<Plug>kommentary_motion_increase", "motion-increase"}
        }
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      d = {
        name = "debug",
        b = {"<CMD>lua require('dap').toggle_breakpoint()<CR>", "toggle breakpoint"},
        c = {"<CMD>lua require('dap').continue()<CR>", "continue"},
        i = {"<CMD>lua require('dap').step_into()<CR>", "step-into"},
        o = {"<CMD>lua require('dap').step_over()<CR>", "step-over"},
        r = {"<CMD>lua require('dap').repl.open({}, 'vsplit')<CR>", "open-repl"},
        t = {
          name = "telescope-debug",
          c = {"<CMD>Telescope dap commands<CR>", "dap-commands"},
          o = {"<CMD>Telescope dap configurations<CR>", "dap-configuratios"},
          l = {"<CMD>Telescope dap list_breakpoints<CR>", "dap-breakpoints"},
          v = {"<CMD>Telescope dap variables<CR>", "dap-variables"},
          f = {"<CMD>Telescope dap frames<CR>", "dap-frames"}
        },
        x = {"<CMD>execute 'lua require('dap').step_out()'<CR>", "step-out"},
        z = {"<CMD>execute 'lua require('dap').run_last()'<CR>", "run-start"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      e = {
        name = "edit",
        d = {"<CMD>StripWhitespace<CR>", "delete-trailing-whitespace"},
        r = {"<CMD>edit!<CR>", "reload"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      f = {
        name = "fold",
        O = {"<CMD>set foldlevel=20<CR>", "open all"},
        C = {"<CMD>set foldlevel=0<CR>", "close all"},
        c = {"<CMD>foldclose<CR>", "close"},
        o = {"<CMD>foldopen<CR>", "open"},
        ["1"] = {"<CMD>set foldlevel=1<CR>", "level1"},
        ["2"] = {"<CMD>set foldlevel=2<CR>", "level2"},
        ["3"] = {"<CMD>set foldlevel=3<CR>", "level3"},
        ["4"] = {"<CMD>set foldlevel=4<CR>", "level4"},
        ["5"] = {"<CMD>set foldlevel=5<CR>", "level5"},
        ["6"] = {"<CMD>set foldlevel=6<CR>", "level6"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      g = {
        name = "git/version-control",
        b = {"<CMD>Gblame<CR>", "fugitive-blame"},
        B = {"<CMD>Gitsigns blame_line<CR>", "gitsigns-blame-line"},
        c = {"<CMD>BCommits<CR>", "commits-for-current-buffer"},
        C = {"<CMD>Gcommit<CR>", "fugitive-commit"},
        d = {"<CMD>Gdiff<CR>", "fugitive-diff"},
        e = {"<CMD>Gedit<CR>", "fugitive-edit"},
        l = {"<CMD>Glog<CR>", "fugitive-log"},
        r = {"<CMD>Gread<CR>", "fugitive-read"},
        s = {"<CMD>Gstatus<CR>", "fugitive-status"},
        w = {"<CMD>Gwrite<CR>", "fugitive-write"},
        p = {"<CMD>Git push<CR>", "fugitive-push"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      h = {
        name = "home/dashboard",
        b = {"<CMD>DashboardJumpMarks<CR>", "book_marks"},
        c = {"<CMD>DashboardChangeColorscheme<CR>", "change_colorscheme"},
        f = {"<CMD>DashboardFindFile<CR>", "find_file"},
        h = {"<CMD>DashboardFindHistory<CR>", "find_history"},
        n = {"<CMD>DashboardNewFile<CR>", "new_file"},
        s = {"<CMD>Telescope session-lens search_session<CR>", "session"},
        w = {"<CMD>DashboardFindWord<CR>", "word"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      j = {
        name = "jump",
        c = {"<CMD>HopChar1<CR>", "char mode 1"},
        d = {"<CMD>HopChar2<CR>", "char mode 2"},
        l = {"<CMD>HopLine<CR>", "line mode"},
        p = {"<CMD>HopPattern<CR>", "pattern mode"},
        w = {"<CMD>HopWord<CR>", "word mode"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      l = {
        name = "lsp",
        a = {"<CMD>Lspsaga code_action<CR>", "code action"},
        A = {"<CMD>Lspsaga range_code_action<CR>", "selected action"},
        d = {"<CMD>Telescope lsp_document_diagnostics<CR>", "document diagnostics"},
        D = {"<CMD>Telescope lsp_workspace_diagnostics<CR>", "workspace diagnostics"},
        f = {"<CMD>LspFormatting<CR>", "format"},
        I = {"<CMD>LspInfo<CR>", "lsp info"},
        v = {"<CMD>LspVirtualTextToggle<CR>", "lsp toggle virtual text"},
        l = {"<CMD>Lspsaga lsp_finder<CR>", "lsp finder"},
        L = {"<CMD>Lspsaga show_line_diagnostics<CR>", "line_diagnostics"},
        p = {"<CMD>Lspsaga preview_definition<CR>", "preview definition"},
        q = {"<CMD>Telescope quickfix<CR>", "quickfix"},
        r = {"<CMD>Lspsaga rename<CR>", "rename"},
        T = {"<CMD>LspTypeDefinition<CR>", "type defintion"},
        x = {"<CMD>cclose<CR>", "close quickfix"},
        s = {"<CMD>Telescope lsp_document_symbols<CR>", "document symbols"},
        S = {"<CMD>Telescope lsp_workspace_symbols<CR>", "workspace symbols"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      m = {
        name = "mark",
        t = {"<CMD>BookmarkToggle<CR>", "toggle"},
        j = {"<CMD>BookmarkNext<CR>", "next mark"},
        k = {"<CMD>BookmarkPrev<CR>", "prev mark"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      p = {
        name = "packer",
        c = {"<CMD>PackerCompile<CR>", "compile"},
        i = {"<CMD>PackerInstall<CR>", "install"},
        l = {"<CMD>PackerLoad<CR>", "load"},
        s = {"<CMD>PackerSync<CR>", "sync"},
        u = {"<CMD>PackerUpdate<CR>", "update"},
        x = {"<CMD>PackerClean<CR>", "clean"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      q = {"<CMD>q<CR>", "quit"},
      ["`"] = {"<CMD>qa!<CR>", "quit-without-saving"}
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      r = {
        name = "refractor",
        f = {"<CMD>lua require('spectre').open_file_search()<CR>", "current-file"},
        o = {"<CMD>lua require('spectre').open()<CR>", "open-panel"},
        w = {"<CMD>lua require('spectre').open_visual()<CR>", "current-word"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      s = {
        name = "search/show",
        e = {"<CMD>Telescope filetypes<CR>", "filetypes"},
        B = {"<CMD>Telescope git_branches<CR>", "git branches"},
        c = {"<CMD>Telescope colorscheme<CR>", "colorschemes"},
        d = {"<CMD>Telescope lsp_document_diagnostics<CR>", "document_diagnostics"},
        D = {"<CMD>Telescope lsp_workspace_diagnostics<CR>", "workspace_diagnostics"},
        f = {"<CMD>Telescope find_files<CR>", "files"},
        h = {"<CMD>Telescope command_history<CR>", "history"},
        i = {"<CMD>Telescope media_files<CR>", "media files"},
        m = {"<CMD>Telescope marks<CR>", "marks"},
        M = {"<CMD>Telescope man_pages<CR>", "man_pages"},
        o = {"<CMD>Telescope vim_options<CR>", "vim_options"},
        s = {"<CMD>Telescope session-lens search_session<CR>", "session_load"},
        t = {"<CMD>Telescope live_grep<CR>", "text"},
        z = {"<CMD>Telescope registers<CR>", "registers"},
        w = {"<CMD>Telescope file_browser<CR>", "buf_fuz_find"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      t = {
        name = "terminal",
        h = {"<CMD>FloatermNew --wintype=split --height=6<CR>", "horizontal-terminal"},
        v = {"<CMD>FloatermNew --wintype=vsplit --width=0.5<CR>", "vertical-terminal"},
        g = {"<CMD>FloatermNew lazygit<CR>", "git"},
        l = {"<CMD>FloatermNew lf<CR>", "lf"},
        n = {"<CMD>FloatermNew node<CR>", "node"},
        p = {"<CMD>FloatermNew python<CR>", "python"},
        m = {"<CMD>FloatermNew lazynpm<CR>", "npm"},
        t = {"<CMD>FloatermToggle<CR>", "toggle"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      w = {
        name = "window",
        w = {"<CMD>execute 'lua require('Navigator').up()'<CR>", "window-up"},
        s = {"<CMD>execute 'lua require('Navigator').down()'<CR>", "window-bottom"},
        a = {"<CMD>execute 'lua require('Navigator').left()'<CR>", "window-left"},
        d = {"<CMD>execute 'lua require('Navigator').right()'<CR>", "window-right"},
        z = {"<CMD>execute 'lua require('Navigator').previous()'<CR>", "window-previous"},
        h = {"<CMD>sp<CR>", "split-horizontal"},
        v = {"<CMD>vs<CR>", "split-vertical"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      x = {
        name = "diagnostic",
        t = {"<CMD>TroubleToggle<CR>                          ", "toggle-diagnostic"},
        w = {"<CMD>TroubleToggle lsp_workspace_diagnostics<CR>", "workspace_diagnostics"},
        d = {"<CMD>TroubleToggle lsp_document_diagnostics<CR> ", "document_diagnostics"},
        q = {"<CMD>TroubleToggle quickfix<CR>                 ", "quickfix"},
        l = {"<CMD>TroubleToggle loclist<CR>                  ", "loclist"},
        r = {"<CMD>TroubleToggle lsp_references<CR>           ", "lsp-references"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      z = {
        name = "session",
        s = {"<CMD>SaveSession<CR>", "save-session"},
        d = {"<CMD>DeleteSession<CR>", "delete-session"}
      }
    },
    {prefix = "<leader>"}
  )
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = WhichKey})
    return self
  end
}
setmetatable(WhichKey, metatable)

return WhichKey
