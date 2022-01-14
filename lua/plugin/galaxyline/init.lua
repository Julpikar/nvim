local line = require("galaxyline")
local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.providers.fileinfo")
local lsp_status = require("lsp-status")

local fn = vim.fn
local cmd = vim.cmd

local function buffer_not_empty()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  else
    return false
  end
end

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
    background = "#F2A60D",
    foreground = "#1b1f24"
  }
}

local item_highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}

local mode_color = function()
  local mode_colors = {
    n = onedark.colors.foreground,
    i = onedark.colors.foreground,
    c = onedark.colors.foreground,
    V = onedark.colors.foreground,
    [""] = onedark.colors.foreground,
    v = onedark.colors.foreground,
    s = onedark.colors.foreground,
    S = onedark.colors.foreground,
    [""] = onedark.colors.foreground,
    R = onedark.colors.foreground,
    r = onedark.colors.foreground,
    ["!"] = onedark.colors.foreground,
    t = onedark.colors.foreground
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
      highlight = {onedark.colors.background, onedark.colors.background},
      separator = icons.slant.left,
      separator_highlight = {onedark.colors.background, onedark.colors.background}
    }
  }
  left[2] = {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = icons.diagnostic.error .. " ",
      highlight = item_highlight
    }
  }
  left[3] = {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = icons.diagnostic.warn .. " ",
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  left[4] = {
    DiagnosticInfo = {
      provider = "DiagnosticInfo",
      icon = icons.diagnostic.info .. " ",
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  left[5] = {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      icon = icons.diagnostic.hint .. " ",
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  left[6] = {
    FileIcon = {
      provider = "FileIcon",
      condition = buffer_not_empty,
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  left[7] = {
    FileName = {
      provider = function()
        local fullname = fn.fnamemodify(fn.getcwd(), ":t") .. "\\" .. fn.expand("%:F")
        local shortname = fileinfo.get_current_file_name()
        return string.len(fullname) > 40 and shortname or fullname
      end,
      condition = buffer_not_empty,
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"},
      separator = icons.slant.right,
      separator_highlight = {onedark.colors.background, onedark.colors.background}
    }
  }
  left[8] = {
    LspStatus = {
      provider = function()
        local get_lsp_client = function()
          local msg = "No Active Lsp"
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
      highlight = {onedark.colors.foreground, onedark.colors.background}
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
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  right[2] = {
    Space = {
      provider = function()
        return " "
      end,
      highlight = {onedark.colors.background, onedark.colors.background}
    }
  }
  right[3] = {
    DiffAdd = {
      provider = "DiffAdd",
      condition = condition.hide_in_width,
      icon = icons.git.add .. " ",
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  right[4] = {
    DiffModified = {
      provider = "DiffModified",
      condition = condition.hide_in_width,
      icon = icons.git.modified .. " ",
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  right[5] = {
    DiffRemove = {
      provider = "DiffRemove",
      condition = condition.hide_in_width,
      icon = icons.git.remove .. " ",
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  right[6] = {
    LineColumn = {
      provider = "LineColumn",
      condition = buffer_not_empty,
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
    }
  }
  right[7] = {
    LinePercent = {
      provider = "LinePercent",
      condition = buffer_not_empty,
      highlight = {onedark.colors.foreground, onedark.colors.background, "bold"}
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
  cmd("highlight! StatusLine guibg=" .. onedark.colors.background .. " guifg=" .. onedark.colors.background)
  cmd("highlight! StatusLineNC guibg=" .. onedark.colors.foreground .. " guifg=" .. onedark.colors.foreground)
  vim.cmd("augroup END")
end

return Galaxy
