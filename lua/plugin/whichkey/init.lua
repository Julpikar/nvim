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
      a = {
        name = "database",
        e = {"<Plug(DBUI_ExecuteQuery)", "execute_query"},
        l = {"<Plug>(DBUI_ToggleResultLayout)", "toggle_result"},
        r = {"<Plug>(DBUI_Redraw)", "redraw"},
        t = {"<CMD>DBUIToggle<CR>", "toggle_DBUI"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      b = {
        name = "buffer",
        d = {"<CMD>Bdelete<CR>", "delete_buffer"},
        l = {"<CMD>JABSOpen<CR>", "list_buffer"},
        n = {"<CMD>BufferLineCycleNext<CR>", "next_buffer"},
        m = {"<CMD>bNext<CR>", "next_buffer_force"},
        p = {"<CMD>BufferLineCyclePrev<CR>", "previous_buffer"},
        t = {"<CMD>BufferLinePick<CR>", "select_tab"},
        w = {"<CMD>Bwipeout<CR>", "wipeout_buffer"},
        x = {"<CMD>Bdelete!<CR>", "forcefully_delete_buffer"},
        z = {"<CMD>Bwipeout!<CR>", "forcefully_wipeout_buffer"}
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
          l = {"<Plug>kommentary_line_decrease", "line_decrease"},
          m = {"<Plug>kommentary_motion_decrease", "motion_decrease"}
        },
        i = {
          name = "increase",
          l = {"<Plug>kommentary_line_increase", "line_increase"},
          m = {"<Plug>kommentary_motion_increase", "motion_increase"}
        }
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      d = {
        name = "debug",
        b = {"<CMD>lua require('dap').toggle_breakpoint()<CR>", "toggle_breakpoint"},
        c = {"<CMD>lua require('dap').continue()<CR>", "continue"},
        i = {"<CMD>lua require('dap').step_into()<CR>", "step_into"},
        o = {"<CMD>lua require('dap').step_over()<CR>", "step_over"},
        r = {"<CMD>lua require('dap').repl.open({}, 'vsplit')<CR>", "open_repl"},
        t = {
          name = "telescope_debug",
          c = {"<CMD>Telescope dap commands<CR>", "dap_commands"},
          o = {"<CMD>Telescope dap configurations<CR>", "dap_configuratios"},
          l = {"<CMD>Telescope dap list_breakpoints<CR>", "dap_breakpoints"},
          v = {"<CMD>Telescope dap variables<CR>", "dap_variables"},
          f = {"<CMD>Telescope dap frames<CR>", "dap_frames"}
        },
        x = {"<CMD>execute 'lua require('dap').step_out()'<CR>", "step_out"},
        z = {"<CMD>execute 'lua require('dap').run_last()'<CR>", "run_start"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      e = {
        name = "edit",
        d = {
          name = "delete",
          l = {[[<CMD>%s/\r//g<CR>]], "newline"},
          w = {"<CMD>StripWhitespace<CR>", "trailing_whitespace"}
        },
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
        name = "git/version_control",
        b = {"<CMD>Gblame<CR>", "fugitive_blame"},
        B = {"<CMD>Gitsigns blame_line<CR>", "gitsigns_blame_line"},
        c = {"<CMD>BCommits<CR>", "commits_for_current_buffer"},
        C = {"<CMD>Gcommit<CR>", "fugitive_commit"},
        d = {"<CMD>Gdiff<CR>", "fugitive_diff"},
        e = {"<CMD>Gedit<CR>", "fugitive_edit"},
        l = {"<CMD>Glog<CR>", "fugitive_log"},
        r = {"<CMD>Gread<CR>", "fugitive_read"},
        s = {"<CMD>Gstatus<CR>", "fugitive_status"},
        w = {"<CMD>Gwrite<CR>", "fugitive_write"},
        p = {"<CMD>Git push<CR>", "fugitive_push"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      h = {
        name = "home/dashboard",
        b = {"<CMD>DashboardJumpMarks<CR>", "bookmarks"},
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
        c = {"<CMD>HopChar1<CR>", "char_mode-1"},
        d = {"<CMD>HopChar2<CR>", "char_mode-2"},
        l = {"<CMD>HopLine<CR>", "line_mode"},
        p = {"<CMD>HopPattern<CR>", "pattern_mode"},
        w = {"<CMD>HopWord<CR>", "word_mode"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      l = {
        name = "lsp",
        k = {"<CMD>lua require('lspsaga.hover').render_hover_doc()<CR>", "documentation"},
        i = {"<CMD>lua vim.lsp.buf.implementation()<CR>", "implementation"},
        h = {"<CMD>lua require('lspsaga.signaturehelp').signature_help()<CR>", "signature_help"},
        R = {"<CMD>lua vim.lsp.buf.references()", "references"},
        a = {"<CMD>Lspsaga code_action<CR>", "code_action"},
        A = {"<CMD>Lspsaga range_code_action<CR>", "range_code_action"},
        d = {"<CMD>Telescope lsp_document_diagnostics<CR>", "document_diagnostics"},
        D = {"<CMD>Telescope lsp_workspace_diagnostics<CR>", "workspace_diagnostics"},
        f = {"<CMD>LspFormatting<CR>", "format"},
        I = {"<CMD>LspInfo<CR>", "lsp_info"},
        v = {"<CMD>LspVirtualTextToggle<CR>", "toggle_virtual_text"},
        l = {"<CMD>Lspsaga lsp_finder<CR>", "finder"},
        L = {"<CMD>Lspsaga show_line_diagnostics<CR>", "line_diagnostics"},
        p = {"<CMD>Lspsaga preview_definition<CR>", "preview_definition"},
        q = {"<CMD>Telescope quickfix<CR>", "quickfix"},
        r = {"<CMD>Lspsaga rename<CR>", "rename"},
        T = {"<CMD>LspTypeDefinition<CR>", "type_defintion"},
        x = {"<CMD>cclose<CR>", "close_quickfix"},
        s = {"<CMD>Telescope lsp_document_symbols<CR>", "document_symbols"},
        S = {"<CMD>Telescope lsp_workspace_symbols<CR>", "workspace_symbols"},
        o = {"<CMD>LspStart<CR>", "lsp_start"},
        n = {"<CMD>LspRestart<CR>", "lsp_restart"},
        m = {"<CMD>LspStop<CR>", "lsp_stop"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      m = {
        name = "mark",
        t = {"<CMD>BookmarkToggle<CR>", "toggle"},
        j = {"<CMD>BookmarkNext<CR>", "next_mark"},
        k = {"<CMD>BookmarkPrev<CR>", "prev_mark"}
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
      ["`"] = {"<CMD>qa!<CR>", "quit_without_saving"}
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      s = {
        name = "search/show",
        e = {"<CMD>Telescope filetypes<CR>", "filetypes"},
        B = {"<CMD>Telescope git_branches<CR>", "git_branches"},
        c = {"<CMD>Telescope colorscheme<CR>", "colorschemes"},
        d = {"<CMD>Telescope lsp_document_diagnostics<CR>", "document_diagnostics"},
        D = {"<CMD>Telescope lsp_workspace_diagnostics<CR>", "workspace_diagnostics"},
        f = {"<CMD>Telescope find_files<CR>", "files"},
        h = {"<CMD>Telescope command_history<CR>", "history"},
        i = {"<CMD>Telescope media_files<CR>", "media_files"},
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
        h = {"<CMD>FloatermNew --wintype=split --height=6<CR>", "horizontal_terminal"},
        v = {"<CMD>FloatermNew --wintype=vsplit --width=0.5<CR>", "vertical_terminal"},
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
        w = {"<CMD>execute 'lua require('Navigator').up()'<CR>", "window_up"},
        s = {"<CMD>execute 'lua require('Navigator').down()'<CR>", "window_bottom"},
        a = {"<CMD>execute 'lua require('Navigator').left()'<CR>", "window_left"},
        d = {"<CMD>execute 'lua require('Navigator').right()'<CR>", "window_right"},
        z = {"<CMD>execute 'lua require('Navigator').previous()'<CR>", "window_previous"},
        h = {"<CMD>sp<CR>", "split_horizontal"},
        v = {"<CMD>vs<CR>", "split_vertical"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      x = {
        name = "diagnostic",
        c = {"close_list"},
        v = {"refresh"},
        j = {"jump_close"},
        m = {"toggle_mode"},
        a = {"toggle_preview"},
        k = {"hover"},
        p = {"preview"},
        t = {"<CMD>TroubleToggle<CR>                          ", "toggle_diagnostic"},
        w = {"<CMD>TroubleToggle lsp_workspace_diagnostics<CR>", "workspace_diagnostics"},
        d = {"<CMD>TroubleToggle lsp_document_diagnostics<CR> ", "document_diagnostics"},
        q = {"<CMD>TroubleToggle quickfix<CR>                 ", "quickfix"},
        l = {"<CMD>TroubleToggle loclist<CR>                  ", "loclist"},
        r = {"<CMD>TroubleToggle lsp_references<CR>           ", "lsp_references"}
      }
    },
    {prefix = "<leader>"}
  )

  wk.register(
    {
      z = {
        name = "session",
        s = {"<CMD>SaveSession<CR>", "save_session"},
        d = {"<CMD>DeleteSession<CR>", "delete_session"}
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
