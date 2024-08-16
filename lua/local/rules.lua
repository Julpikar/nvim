local api = vim.api
local bo = vim.bo
local fn = vim.fn

local Rules = {}

local exclude_filetype = { "help", "html", "nofile", "prompt", "terminal", "toggleterm", "trouble" }

local rules = {
  { "\\s\\+$", "Trailing whitespace" },
  { "\\(^\\s*\\)\\@<=\\t\\+", "Using tab indentation" },
  { "\\%>80v.\\+", "Overlong lines" },
}

local function violations()
  fn.clearmatches()

  if fn.index(exclude_filetype, bo.filetype) >= 0 then
    return
  end

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

function Rules.setup()
  local rules_augroup = api.nvim_create_augroup("Rules", { clear = true })
  api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TermOpen" }, {
    group = rules_augroup,
    callback = violations,
  })
end

return Rules
