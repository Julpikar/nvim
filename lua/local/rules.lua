local api = vim.api
local bo = vim.bo
local fn = vim.fn

local Rules = {}

local exclude_buftype = { "help", "nofile", "prompt", "terminal" }

local rules = {
  { "\\s\\+$", "Trailing whitespace" },
  { "\\%>80v.\\+", "Overlong lines" },
}

local function diagnostic_violations()
  fn.clearmatches()

  -- trailing empty lines
  local trailing_empty_lines_regex = "\\($\\n\\s*\\)\\+\\%$"
  fn.matchadd("SpellBad", trailing_empty_lines_regex)

  local rules_namespace = api.nvim_create_namespace("RulesNamespace")
  local lines = api.nvim_buf_get_lines(0, 0, -1, false)
  local diagnostics = {}
  local empty_lines = { 0 }

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

  vim.diagnostic.set(rules_namespace, 0, diagnostics, {})
end

local queued = false
local function defer_func(timeout)
  if queued then
    return
  end
  vim.defer_fn(function()
    queued = false
    diagnostic_violations()
  end, timeout)
  queued = true
end

local function violations()
  if not api.nvim_get_option_value("modifiable", { buf = 0 }) or vim.tbl_contains(exclude_buftype, bo.buftype) then
    return
  end

  defer_func(500)
end

local function remove_by_cmd(command)
  local view = vim.fn.winsaveview()
  vim.cmd("silent keepjumps keeppatterns " .. command)
  vim.fn.winrestview(view)
end

local function cleanup()
  -- trailing whitespace
  remove_by_cmd("%s/\\s\\+$//e")

  -- trailing empty lines
  remove_by_cmd("%s/\\($\\n\\s*\\)\\+\\%$//e")
end

function Rules.setup()
  local rules_augroup = api.nvim_create_augroup("Rules", { clear = true })
  api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TermOpen" }, {
    group = rules_augroup,
    callback = violations,
  })
  api.nvim_create_autocmd({ "BufWrite" }, {
    group = rules_augroup,
    callback = cleanup,
  })
end

return Rules
