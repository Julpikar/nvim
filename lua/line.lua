-- Bufferline
vim.cmd('autocmd BufAdd,BufEnter * if len(getbufinfo({\'buflisted\':1})) > 0 | set showtabline=2 | endif')
vim.cmd('autocmd VimEnter * set showtabline=1')
require'bufferline'.setup{
        options = {
            view = "multiwindow",
            numbers = "none",
            number_style = "",
            mappings = true,
            buffer_close_icon= '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 18,
            show_buffer_close_icons = true,
            persist_buffer_sort = true,
            separator_style = "slant",
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            sort_by = 'directory'
        }
    }

-- Statusline
local gl = require('galaxyline')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')

local colors = {
    bg = '#3c474d',
    fg = '#d8caac',
    section_bg = '#465258',
    line_bg = '#2b353b',
    red = '#e68183',
    orange = '#e39b7b',
    yellow = '#d9bb80',
    green = '#a7c080',
    blue = '#83b6af',
    purple = '#d39bb6',
    magenta = '8b008b',
}

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
    return false
end

local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 and buffer_not_empty() then
        return true
    end
    return false
end

gls.left[1] = {
    FirstElement = {
        provider = function() return '▋' end,
        highlight = {colors.green, colors.section_bg}
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                V = 'VISUAL',
                [''] = 'VISUAL',
                v ='VISUAL',
                c  = 'COMMAND-LINE',
                ['r?'] = ':CONFIRM',
                rm = '--MORE',
                R  = 'REPLACE',
                Rv = 'VIRTUAL',
                s  = 'SELECT',
                S = 'SELECT',
                ['r']  = 'HIT-ENTER',
                [''] = 'SELECT',
                t  = 'TERMINAL',
                ['!']  = 'SHELL',
            }
            local mode_color = {
                n = colors.green,
                i = colors.blue,
                v = colors.magenta,
                [''] = colors.blue,
                V=colors.blue,
                c = colors.red,
                no = colors.magenta,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.purple,
                Rv = colors.purple,
                cv = colors.red,
                ce=colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.green,t = colors.green,
                c  = colors.purple,
                ['r?'] = colors.red,
                ['r']  = colors.red,
                rm = colors.red,
                R  = colors.yellow,
                Rv = colors.magenta,
            }
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
            return alias[vim_mode] .. '  '
        end,

        highlight = {colors.bg, colors.bg, 'bold'},
        separator = " ",
        separator_highlight = {colors.bg, colors.section_bg}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg}
    }
}

gls.left[4] = {
    FileName = {
        provider = {'FileName','FileSize'},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.section_bg},
        separator = " ",
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

gls.left[5] = {
    GitIcon = {
        provider = function() return ' ' end,
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.red,colors.bg}
    }
}

gls.left[6] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.fg,colors.bg,'bold'}
    }
}

gls.left[7] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = ' ',
        highlight = { colors.green, colors.bg}
    }
}
gls.left[8] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.orange,colors.bg}
    }
}
gls.left[9] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.red,colors.bg}
    }
}

local has_trailing_whitespace = function()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return true
    else
        return false
    end
end

local function get_nvim_lsp_diagnostic(diag_type)
    if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then return 0 end

    local active_clients = vim.lsp.get_active_clients()

    if active_clients then
        local count = 0

        for _, client in ipairs(active_clients) do
            count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(),diag_type,client.id)
        end
        return count
    end
end

local has_diagnostic = function ()
    local warn_count = get_nvim_lsp_diagnostic('Warning')
    local err_count = get_nvim_lsp_diagnostic('Error')
    local info_count = get_nvim_lsp_diagnostic('Information')
    local sum_diagnostic = warn_count + err_count + info_count
    if sum_diagnostic > 0 then
        return true
    else
        return false
    end
end

local has_diagnostic_or_whitespace = function()
    return has_diagnostic() or has_trailing_whitespace()
end

gls.left[10] = {
    LeftEnd = {
        provider = function() return '' end,
        condition = has_diagnostic_or_whitespace,
        highlight = {colors.section_bg,colors.bg}
    }
}

gls.left[11] = {
    TrailingWhiteSpace = {
        provider = function()
            if has_trailing_whitespace() then
                return ' '
            else
                return nil
            end
        end,
        icon = '   ',
        condition = has_diagnostic_or_whitespace,
        highlight = {colors.yellow,colors.section_bg}
    }
}

gls.left[12] = {
    Space = {
        provider = function () return ' ' end,
        condition = has_diagnostic_or_whitespace,
        highlight = {colors.section_bg,colors.section_bg}
    }
}

gls.left[13] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        condition = has_diagnostic_or_whitespace,
        icon = '  ',
        highlight = {colors.red,colors.section_bg}
    }
}

gls.left[14] = {
    Space = {
        provider = function () return ' ' end,
        condition = has_diagnostic_or_whitespace,
        highlight = {colors.section_bg,colors.section_bg}
    }
}

gls.left[15] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        condition = has_diagnostic_or_whitespace,
        icon = '  ',
        highlight =  {colors.orange,colors.section_bg}
    }
}

gls.left[16] = {
    Space = {
        provider = function () return ' ' end,
        condition = has_diagnostic_or_whitespace,
        highlight = {colors.section_bg,colors.section_bg}
    }
}

gls.left[17] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        condition = has_diagnostic_or_whitespace,
        icon = '  🗱',
        highlight = {colors.blue,colors.section_bg},
        separator = ' ',
        separator_highlight = { colors.section_bg, colors.bg }
    }
}

function get_lsp_current_function()
    if vim.fn.exists('b:lsp_current_function') == 1 then
        return vim.b.lsp_current_function
    end
    return ""
end

gls.left[18] = {
    LspFunc = {
        provider = get_lsp_current_function,
        condition = buffer_not_empty,
        icon = '  λ ',
        highlight = {colors.yellow,colors.bg}
    }
}

gls.right[1] = {
    RightStart = {
        provider = function() return ' ' end,
        condition = buffer_not_empty,
        highlight = {colors.section_bg,colors.section_bg},
        separator = '',
        separator_highlight = {colors.section_bg,colors.bg}
    }
}

gls.right[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg}
    }
}
gls.right[3]= {
    FileFormat = {
        provider = function() return vim.bo.filetype:gsub("^%l", string.upper) end,
        condition = buffer_not_empty,
        highlight = { colors.fg,colors.section_bg,'bold'}
    }
}
gls.right[4] = {
    LineInfo = {
        provider = 'LineColumn',
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.section_bg },
        separator = '  ',
        separator_highlight = { colors.line_bg, colors.section_bg }
    }
}

gls.right[5] = {
    PerCent = {
        provider = 'LinePercent',
        condition = buffer_not_empty,
        highlight = {colors.fg,colors.section_bg,'bold'},
        separator = ' ',
        separator_highlight = {colors.line_bg,colors.section_bg}
    }
}

gls.right[6] = {
    Heart = {
        provider = function() return '🔥 ' end,
        condition = buffer_not_empty,
        highlight = { colors.red, colors.section_bg },
        separator = ' ',
        separator_highlight = {colors.line_bg , colors.section_bg, 'bold' }
    }
}

-- Short status line
gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.section_bg },
        separator = ' ',
        separator_highlight = { colors.section_bg, colors.bg }
    }
}

gls.short_line_right[2] = {
    BufferIcon = {
        provider = 'BufferIcon',
        condition = buffer_not_empty,
        highlight = { colors.yellow, colors.section_bg }
    }
}
