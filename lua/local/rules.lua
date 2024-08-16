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

local function find_sequence(empty_lines)
  local list_sequence = {}

  local insert_line = function(line)
    local found = false
    for j = 1, #list_sequence, 1 do
      if line == list_sequence[j] then
        found = true
        break
      end
    end

    if not found then
      list_sequence[#list_sequence + 1] = line
    end
  end

  local last = fn.line("$") + 1
  for i = #empty_lines, 1, -1 do
    local gap = last - empty_lines[i]
    if gap == 1 then
      insert_line(empty_lines[i])
      insert_line(last)
    end
    last = empty_lines[i]
  end

  return list_sequence
end

local function violations()
  fn.clearmatches()

  if fn.index(exclude_filetype, vim.o.filetype) >= 0 then
    return
  end

  local rules_namespace = api.nvim_create_namespace("RulesNamespace")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local diagnostics = {}
  local empty_lines = { 0 }

  for i, line in ipairs(lines) do
    if line == "" then
      empty_lines[#empty_lines + 1] = i
    end
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

  local list_sequence = find_sequence(empty_lines)

  for i = 1, #list_sequence, 1 do
    local lnum = list_sequence[i]

    if lnum ~= 0 then
      table.insert(diagnostics, {
        lnum = lnum - 1,
        col = 0,
        end_col = 0,
        message = "Trailing empty lines",
        severity = vim.diagnostic.severity.HINT,
      })
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
