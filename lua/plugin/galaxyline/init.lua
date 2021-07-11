local line = require("galaxyline")
local diagnostic = require("galaxyline.provider_diagnostic")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require("galaxyline.provider_fileinfo")
local condition = require("galaxyline.condition")
local lspclient = require("galaxyline.provider_lsp")

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
    FileIcon = {
      provider = fileinfo.get_file_icon,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, onedark.colors.dark}
    }
  }
  left[3] = {
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
  left[4] = {
    LspStatus = {
      provider = function()
        local lsp_status = require("lsp-status")
        local status = lsp_status.status()
        local server_name = lspclient.get_lsp_client()
        return string.len(status) < 5 and " " .. server_name or status
      end,
      condition = condition.buffer_not_empty,
      highlight = {onedark.colors.white, onedark.colors.dark}
    }
  }
end

local function right_config()
  local right = line.section.right
  right[1] = {
    GitBranch = {
      provider = vcs.get_git_branch,
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
      provider = vcs.diff_add,
      condition = condition.hide_in_width,
      icon = icons.git.add .. " ",
      highlight = {onedark.colors.green, onedark.colors.dark}
    }
  }
  right[4] = {
    DiffModified = {
      provider = vcs.diff_modified,
      condition = condition.hide_in_width,
      icon = icons.git.modified .. " ",
      highlight = {onedark.colors.yellow, onedark.colors.dark}
    }
  }
  right[5] = {
    DiffRemove = {
      provider = vcs.diff_remove,
      condition = condition.hide_in_width,
      icon = icons.git.remove .. " ",
      highlight = {onedark.colors.red, onedark.colors.dark}
    }
  }
  right[6] = {
    LineColumn = {
      provider = fileinfo.line_column,
      condition = condition.buffer_not_empty,
      highlight = {onedark.colors.blue, onedark.colors.dark}
    }
  }
  right[7] = {
    LinePercent = {
      provider = fileinfo.current_line_percent,
      condition = condition.buffer_not_empty,
      highlight = {onedark.colors.white, onedark.colors.dark}
    }
  }
  right[8] = {
    DiagnosticError = {
      provider = diagnostic.get_diagnostic_error,
      icon = icons.diagnostic.error .. " ",
      highlight = {onedark.colors.red, onedark.colors.dark}
    }
  }
  right[9] = {
    DiagnosticWarn = {
      provider = diagnostic.get_diagnostic_warn,
      icon = icons.diagnostic.warn .. " ",
      highlight = {onedark.colors.yellow, onedark.colors.dark}
    }
  }
  right[10] = {
    DiagnosticInfo = {
      provider = diagnostic.get_diagnostic_info,
      icon = icons.diagnostic.info .. " ",
      highlight = {onedark.colors.green, onedark.colors.dark}
    }
  }
  right[11] = {
    DiagnosticHint = {
      provider = diagnostic.get_diagnostic_hint,
      icon = icons.diagnostic.hint .. " ",
      highlight = {onedark.colors.orange, onedark.colors.dark}
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

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Galaxy})
    return self
  end
}
setmetatable(Galaxy, metatable)

return Galaxy
