local SymbolUsage = {
  "Wansmer/symbol-usage.nvim",
  event = "BufReadPre",
}

local function symbol_highlight()
  local nvim_get_hl = vim.api.nvim_get_hl
  local nvim_set_hl = vim.api.nvim_set_hl

  nvim_set_hl(0, "SymbolUsageRounding", { fg = nvim_get_hl(0, { name =
  "CursorColumn" }).bg, italic = true })
  nvim_set_hl(0, "SymbolUsageContent", {
    bg = nvim_get_hl(0, { name = "CursorColumn" }).bg,
    fg = nvim_get_hl(0, {
      name = "Comment",
    }).fg,
    italic = true,
  })
  nvim_set_hl(0, "SymbolUsageRef", {
    fg = nvim_get_hl(0, { name = "Function" }).fg,
    bg = nvim_get_hl(0, { name = "CursorColumn" }).bg,
    italic = true,
  })
  nvim_set_hl(
    0,
    "SymbolUsageDef",
    { fg = nvim_get_hl(0, { name = "Type" }).fg, bg = nvim_get_hl(0, { name =
    "CursorColumn" }).bg, italic = true }
  )
  nvim_set_hl(0, "SymbolUsageImpl", {
    fg = nvim_get_hl(0, { name = "@keyword" }).fg,
    bg = nvim_get_hl(0, { name = "CursorColumn" }).bg,
    italic = true,
  })
end

local function text_format(symbol)
  local res = {}

  local round_start = { "", "SymbolUsageRounding" }
  local round_end = { "", "SymbolUsageRounding" }

  if symbol.references then
    local usage = symbol.references <= 1 and "usage" or "usages"
    local num = symbol.references == 0 and "no" or symbol.references
    table.insert(res, round_start)
    table.insert(res, { "󰌹 ", "SymbolUsageRef" })
    table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.definition then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, round_start)
    table.insert(res, { "󰳽 ", "SymbolUsageDef" })
    table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.implementation then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, round_start)
    table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
    table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent"
  })
    table.insert(res, round_end)
  end

  return res
end

SymbolUsage.config = function()
  require("symbol-usage").setup({
    text_format = text_format,
  })

  symbol_highlight()
end

return SymbolUsage
