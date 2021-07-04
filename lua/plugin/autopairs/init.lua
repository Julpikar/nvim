local AutoPairs = {}

function AutoPairs.config()
  -- nvim-compe
  require("nvim-autopairs.completion.compe").setup(
    {
      map_cr = true, --  map <CR> on insert mode
      map_complete = true -- it will auto insert `(` after select function or method item
    }
  )

  -- Treesitter
  local Rule = require("nvim-autopairs.rule")
  local npairs = require("nvim-autopairs")

  npairs.setup(
    {
      check_ts = true,
      ts_config = {
        lua = {"string"},
        -- it will not add pair on that treesitter node
        javascript = {"template_string"},
        java = false
        -- don't check treesitter on java
      }
    }
  )

  require("nvim-treesitter.configs").setup {
    autopairs = {enable = true}
  }

  local ts_conds = require("nvim-autopairs.ts-conds")

  -- press % => %% is only inside comment or string
  npairs.add_rules(
    {
      Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({"string", "comment"})),
      Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({"function"}))
    }
  )
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = AutoPairs})
    return self
  end
}
setmetatable(AutoPairs, metatable)

return AutoPairs
