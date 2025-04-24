local api = vim.api
local bo = vim.bo
local fn = vim.fn

local Rules = {}

local exclude_buftype = { "help", "nofile", "prompt", "terminal" }
local exclude_filetype = { "NeogitPopup", "NeogitStatus" }

local rules = {
  { "\\s\\+$", "Trailing whitespace!" },
}

local function rule_violations()
  fn.clearmatches()

  -- trailing empty lines
  local trailing_empty_lines_regex = "\\($\\n\\s*\\)\\+\\%$"
  fn.matchadd("SpellBad", trailing_empty_lines_regex)

  local rules_namespace = api.nvim_create_namespace("RulesNamespace")
  local bufnr = api.nvim_get_current_buf()
  local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local diagnostics = {}

  for i, line in ipairs(lines) do
    -- Other rules
    for j = 1, #rules, 1 do
      local pattern, msg = unpack(rules[j])
      local m, s, e = unpack(fn.matchstrpos(line, pattern))
      if s >= 0 then
        table.insert(diagnostics, {
          lnum = i - 1,
          col = s,
          end_col = e,
          message = msg,
          severity = vim.diagnostic.severity.HINT,
        })
      end
    end
  end

  vim.diagnostic.set(rules_namespace, bufnr, diagnostics, {})
end

function Rules.show_violations()
  local bufnr = api.nvim_get_current_buf()
  if
    not api.nvim_get_option_value("modifiable", { buf = bufnr })
    or vim.tbl_contains(exclude_buftype, bo.buftype)
    or vim.tbl_contains(exclude_filetype, bo.filetype)
  then
    return
  end

  rule_violations()
end

local function remove_by_cmd(command)
  local view = vim.fn.winsaveview()
  vim.cmd("silent keepjumps keeppatterns " .. command)
  vim.fn.winrestview(view)
end

function Rules.cleanup()
  local bufnr = api.nvim_get_current_buf()
  if not api.nvim_get_option_value("modifiable", { buf = bufnr }) then
    return
  end

  -- trailing whitespace
  remove_by_cmd("%s/\\s\\+$//e")

  -- trailing empty lines
  remove_by_cmd("%s/\\($\\n\\s*\\)\\+\\%$//e")
end

return Rules
