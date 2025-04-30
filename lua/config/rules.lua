local api = vim.api
local bo = vim.bo
local fn = vim.fn

local Rules = {}

local empty_lines_ns = api.nvim_create_namespace("EmptyLineNS")
local trailing_whitespace_ns = api.nvim_create_namespace("TrailingWhiteNS")

local function check_empty_lines(lines)
  local diagnostics = {}
  for i = #lines, 1, -1 do
    if not lines[i]:match("^%s*$") then
      return diagnostics
    end
    table.insert(diagnostics, {
      lnum = i - 1,
      col = 0,
      message = "Empty line",
      severity = vim.diagnostic.severity.INFO,
    })
  end
  return diagnostics
end

local function check_trailing_whitespace(lines)
  local diagnostics = {}
  for i = #lines, 1, -1 do
    local _, start_col, end_col = unpack(fn.matchstrpos(lines[i], "\\s\\+$"))
    if start_col >= 0 then
      table.insert(diagnostics, {
        lnum = i - 1,
        col = start_col,
        end_col = end_col,
        message = "Trailing whitespace",
        severity = vim.diagnostic.severity.INFO,
      })
    end
  end
  return diagnostics
end

function Rules.show_violations()
  local bufnr = api.nvim_get_current_buf()
  local exclude_buftype = { "help", "nofile", "prompt", "terminal" }
  local exclude_filetype = { "NeogitPopup", "NeogitStatus" }
  if
    not api.nvim_get_option_value("modifiable", { buf = bufnr })
    or vim.tbl_contains(exclude_buftype, bo.buftype)
    or vim.tbl_contains(exclude_filetype, bo.filetype)
  then
    return
  end

  local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)

  vim.diagnostic.reset(empty_lines_ns, bufnr)
  local empty_lines = check_empty_lines(lines)
  if #empty_lines ~= 0 then
    vim.diagnostic.set(empty_lines_ns, bufnr, empty_lines, {})
  end

  vim.diagnostic.reset(trailing_whitespace_ns, bufnr)
  local trailing_whitespaces = check_trailing_whitespace(lines)
  if #trailing_whitespaces ~= 0 then
    vim.diagnostic.set(trailing_whitespace_ns, bufnr, trailing_whitespaces, {})
  end
end

return Rules
