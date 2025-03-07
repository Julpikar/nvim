-- Cut-down version Project.nvim
-- https://github.com/ahmedkhalf/project.nvim
local Root = {}

local configs = {
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "CMakeLists.txt" },
  scope_chdir = "global",
  ignore_lsp = {},
}

local function find_lsp_root()
  -- Get lsp client for current buffer
  -- Returns nil or string
  local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return nil
  end

  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.tbl_contains(filetypes, buf_ft) then
      if not vim.tbl_contains(configs.ignore_lsp, client.name) then
        return client.config.root_dir, client.name
      end
    end
  end

  return nil
end

-- Credits for this module goes to: David Manura
-- https://github.com/davidm/lua-glob-pattern
local function globtopattern(g)
  -- Some useful references:
  -- - apr_fnmatch in Apache APR.  For example,
  --   http://apr.apache.org/docs/apr/1.3/group__apr__fnmatch.html
  --   which cites POSIX 1003.2-1992, section B.6.

  local p = "^" -- pattern being built
  local i = 0 -- index in g
  local c -- char at index i in g.

  -- unescape glob char
  local function unescape()
    if c == "\\" then
      i = i + 1
      c = g:sub(i, i)
      if c == "" then
        p = "[^]"
        return false
      end
    end
    return true
  end

  -- escape pattern char
  local function escape(c)
    return c:match("^%w$") and c or "%" .. c
  end

  -- Convert tokens at end of charset.
  local function charset_end()
    while 1 do
      if c == "" then
        p = "[^]"
        return false
      elseif c == "]" then
        p = p .. "]"
        break
      else
        if not unescape() then
          break
        end
        local c1 = c
        i = i + 1
        c = g:sub(i, i)
        if c == "" then
          p = "[^]"
          return false
        elseif c == "-" then
          i = i + 1
          c = g:sub(i, i)
          if c == "" then
            p = "[^]"
            return false
          elseif c == "]" then
            p = p .. escape(c1) .. "%-]"
            break
          else
            if not unescape() then
              break
            end
            p = p .. escape(c1) .. "-" .. escape(c)
          end
        elseif c == "]" then
          p = p .. escape(c1) .. "]"
          break
        else
          p = p .. escape(c1)
          i = i - 1 -- put back
        end
      end
      i = i + 1
      c = g:sub(i, i)
    end
    return true
  end

  -- Convert tokens in charset.
  local function charset()
    i = i + 1
    c = g:sub(i, i)
    if c == "" or c == "]" then
      p = "[^]"
      return false
    elseif c == "^" or c == "!" then
      i = i + 1
      c = g:sub(i, i)
      if c == "]" then
        -- ignored
      else
        p = p .. "[^"
        if not charset_end() then
          return false
        end
      end
    else
      p = p .. "["
      if not charset_end() then
        return false
      end
    end
    return true
  end

  -- Convert tokens.
  while 1 do
    i = i + 1
    c = g:sub(i, i)
    if c == "" then
      p = p .. "$"
      break
    elseif c == "?" then
      p = p .. "."
    elseif c == "*" then
      p = p .. ".*"
    elseif c == "[" then
      if not charset() then
        break
      end
    elseif c == "\\" then
      i = i + 1
      c = g:sub(i, i)
      if c == "" then
        p = p .. "\\$"
        break
      end
      p = p .. escape(c)
    else
      p = p .. escape(c)
    end
  end
  return p
end

local function find_pattern_root()
  local search_dir = vim.fn.expand("%:p:h", true)
  if vim.fn.has("win32") > 0 then
    search_dir = search_dir:gsub("\\", "/")
  end

  local last_dir_cache = ""
  local curr_dir_cache = {}

  local function get_parent(path)
    path = path:match("^(.*)/")
    if path == "" then
      path = "/"
    end
    return path
  end

  local function get_files(file_dir)
    last_dir_cache = file_dir
    curr_dir_cache = {}

    local dir = vim.uv.fs_scandir(file_dir)
    if dir == nil then
      return
    end

    while true do
      local file = vim.uv.fs_scandir_next(dir)
      if file == nil then
        return
      end

      table.insert(curr_dir_cache, file)
    end
  end

  local function is(dir, identifier)
    dir = dir:match(".*/(.*)")
    return dir == identifier
  end

  local function sub(dir, identifier)
    local path = get_parent(dir)
    while true do
      if is(path, identifier) then
        return true
      end
      local current = path
      path = get_parent(path)
      if current == path then
        return false
      end
    end
  end

  local function child(dir, identifier)
    local path = get_parent(dir)
    return is(path, identifier)
  end

  local function has(dir, identifier)
    if last_dir_cache ~= dir then
      get_files(dir)
    end
    local pattern = globtopattern(identifier)
    for _, file in ipairs(curr_dir_cache) do
      if file:match(pattern) ~= nil then
        return true
      end
    end
    return false
  end

  local function match(dir, pattern)
    local first_char = pattern:sub(1, 1)
    if first_char == "=" then
      return is(dir, pattern:sub(2))
    elseif first_char == "^" then
      return sub(dir, pattern:sub(2))
    elseif first_char == ">" then
      return child(dir, pattern:sub(2))
    else
      return has(dir, pattern)
    end
  end

  -- breadth-first search
  while true do
    for _, pattern in ipairs(configs.patterns) do
      local exclude = false
      if pattern:sub(1, 1) == "!" then
        exclude = true
        pattern = pattern:sub(2)
      end
      if match(search_dir, pattern) then
        if exclude then
          break
        else
          return search_dir, "pattern " .. pattern
        end
      end
    end

    local parent = get_parent(search_dir)
    if parent == search_dir or parent == nil then
      return nil
    end

    search_dir = parent
  end
end

local function get_project_root()
  -- returns project root, as well as method
  for _, detection_method in ipairs(configs.detection_methods) do
    if detection_method == "lsp" then
      local root, lsp_name = find_lsp_root()
      if root ~= nil then
        return root, '"' .. lsp_name .. '"' .. " lsp"
      end
    elseif detection_method == "pattern" then
      local root, method = find_pattern_root()
      if root ~= nil then
        return root, method
      end
    end
  end
end

local function set_pwd(dir, method)
  if dir ~= nil then
    if vim.fn.getcwd() ~= dir then
      local scope_chdir = configs.scope_chdir
      if scope_chdir == "global" then
        vim.api.nvim_set_current_dir(dir)
      elseif scope_chdir == "tab" then
        vim.cmd("tcd " .. dir)
      elseif scope_chdir == "win" then
        vim.cmd("lcd " .. dir)
      else
        return
      end

      vim.notify("Set CWD to " .. dir .. " using " .. method)
    end
    return true
  end

  return false
end

function Root.setup()
  vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
    pattern = { "*" },
    callback = function()
      local root, method = get_project_root()
      set_pwd(root, method)
    end,
    nested = true,
  })
end

return Root
