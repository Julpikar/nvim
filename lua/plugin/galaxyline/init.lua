local line = require("galaxyline")
local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.provider_fileinfo")
local lsp_status = require("lsp-status")

local fn = vim.fn
local cmd = vim.cmd

local icons = {
  slant = {
    right = " ",
    left = " "
  },
  diagnostic = {
    ok = "",
    error = "",
    warn = "",
    info = "",
    hint = ""
  },
  git = {
    branch = "",
    add = "",
    modified = "",
    remove = ""
  }
}

local onedark = {
  colors = {
    dark = "#1b1f24",
    cyan = "#48B0BD",
    white = "#535965",
    red = "#E55561",
    orange = "#CC9057",
    yellow = "#E2B86B",
    green = "#8EBD6B",
    blue = "#4FA6ED",
    purple = "#BF68D9"
  }
}

local mode_color = function()
  local mode_colors = {
    n = onedark.colors.green,
    i = onedark.colors.blue,
    c = onedark.colors.yellow,
    V = onedark.colors.purple,
    [""] = onedark.colors.yellow,
    v = onedark.colors.purple,
    s = onedark.colors.orange,
    S = onedark.colors.orange,
    [""] = onedark.colors.orange,
    R = onedark.colors.red,
    r = onedark.colors.red,
    ["!"] = onedark.colors.cyan,
    t = onedark.colors.blue
  }

  return mode_colors[vim.fn.mode()]
end

local Galaxy = {}

local function left_config()
  local left = line.section.left
  left[1] = {
    ViMode = {
      provider = function()
        local alias = {
          n = "Ⓝ ",
          i = "Ⓘ ",
          c = "Ⓒ ",
          V = "Ⓥ ",
          [""] = "Ⓥ ",
          v = "Ⓥ ",
          s = "Ⓢ ",
          S = "Ⓢ ",
          [""] = "Ⓢ ",
          R = "Ⓡ ",
          r = "Ⓡ ",
          ["!"] = "𥉉 ",
          t = "Ⓣ "
        }
        local color = mode_color()
        if color ~= nil then
          vim.api.nvim_command("hi GalaxyViMode guifg=" .. color .. " gui=bold")
          return "  " .. alias[vim.fn.mode()]
        end
        return ""
      end,
      highlight = {onedark.colors.dark, onedark.colors.dark},
      separator = icons.slant.left,
      separator_highlight = {onedark.colors.dark, onedark.colors.dark}
    }
  }
  left[2] = {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = icons.diagnostic.error .. " ",
      highlight = {onedark.colors.red, onedark.colors.dark}
    }
  }
  left[3] = {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = icons.diagnostic.warn .. " ",
      highlight = {onedark.colors.yellow, onedark.colors.dark}
    }
  }
  left[4] = {
    DiagnosticInfo = {
      provider = "DiagnosticInfo",
      icon = icons.diagnostic.info .. " ",
      highlight = {onedark.colors.green, onedark.colors.dark}
    }
  }
  left[5] = {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      icon = icons.diagnostic.hint .. " ",
      highlight = {onedark.colors.orange, onedark.colors.dark}
    }
  }
  left[6] = {
    FileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, onedark.colors.dark}
    }
  }
  left[7] = {
    FileName = {
      provider = function()
        local fullname = fn.fnamemodify(fn.getcwd(), ":t") .. "\\" .. fn.expand("%:F")
        local shortname = fileinfo.get_current_file_name()
        return string.len(fullname) > 40 and shortname or fullname
      end,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, onedark.colors.dark},
      separator = icons.slant.right,
      separator_highlight = {onedark.colors.dark, onedark.colors.dark}
    }
  }
  left[8] = {
    LspStatus = {
      provider = function()
        local get_lsp_client = function(msg)
          local msg = msg or "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end
        local status = lsp_status.status()
        local server_name = get_lsp_client()
        return string.len(status) < 5 and " " .. server_name or status
      end,
      condition = function()
        local tbl = {["dashboard"] = true, [""] = true}
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      highlight = {onedark.colors.white, onedark.colors.dark}
    }
  }
end

local function right_config()
  local right = line.section.right
  right[1] = {
    GitBranch = {
      provider = "GitBranch",
      condition = condition.check_git_workspace,
      icon = icons.git.branch .. " ",
      highlight = {onedark.colors.red, onedark.colors.dark, "bold"}
    }
  }
  right[2] = {
    Space = {
      provider = function()
        return " "
      end,
      highlight = {onedark.colors.dark, onedark.colors.dark}
    }
  }
  right[3] = {
    DiffAdd = {
      provider = "DiffAdd",
      condition = condition.hide_in_width,
      icon = icons.git.add .. " ",
      highlight = {onedark.colors.green, onedark.colors.dark}
    }
  }
  right[4] = {
    DiffModified = {
      provider = "DiffModified",
      condition = condition.hide_in_width,
      icon = icons.git.modified .. " ",
      highlight = {onedark.colors.yellow, onedark.colors.dark}
    }
  }
  right[5] = {
    DiffRemove = {
      provider = "DiffRemove",
      condition = condition.hide_in_width,
      icon = icons.git.remove .. " ",
      highlight = {onedark.colors.red, onedark.colors.dark}
    }
  }
  right[6] = {
    LineColumn = {
      provider = "LineColumn",
      condition = condition.buffer_not_empty,
      highlight = {onedark.colors.blue, onedark.colors.dark}
    }
  }
  right[7] = {
    LinePercent = {
      provider = "LinePercent",
      condition = condition.buffer_not_empty,
      highlight = {onedark.colors.white, onedark.colors.dark}
    }
  }
end

function Galaxy.config()
  line.short_line_list = {"NvimTree", "Vista", "packer"}
  left_config()
  right_config()

  -- Custom highlight
  vim.cmd("augroup StatusLineHightlight")
  vim.cmd("autocmd!")
  cmd("highlight! StatusLine guibg=" .. onedark.colors.dark .. " guifg=" .. onedark.colors.dark)
  cmd("highlight! StatusLineNC guibg=" .. onedark.colors.dark .. " guifg=" .. onedark.colors.dark)
  vim.cmd("augroup END")
end

return Galaxy
