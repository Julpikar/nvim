-- lua rewritted vim-lastplace.vim
local filetype_ignore = { "gitcommit", "gitrebase", "svn", "hgcommit" }
local buftype_ignore = { "quickfix", "nofile", "help" }
local open_fold = false

local Lastplace = {}

local function find()
  local fn = vim.fn
  if fn.index(buftype_ignore, vim.o.buftype) ~= -1 then
    return
  end

  if fn.index(filetype_ignore, vim.o.filetype) ~= -1 then
    return
  end

  -- if the file does not exist on disk (a new, unsaved file) then do nothing
  if fn.empty(fn.glob("%")) == 1 then
    return
  end

  if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
    -- if the last edit position is set and is less than the
    -- number of lines in this buffer.
    if fn.line("w$") == fn.line("$") then
      -- if the last line in the current buffer is
      -- also the last line visible in this window
      fn.execute('normal! g`"')
    elseif fn.line("$") - fn.line("'\"") > ((fn.line("w$") - fn.line("w0")) / 2) - 1 then
      -- if we're not at the bottom of the file, center the
      -- cursor on the screen after we make the jump
      fn.execute('normal! g`"zz')
    else
      -- otherwise, show as much context as we can by jumping
      -- to the end of the file and then to the mark. If we
      -- pressed zz here, there would be blank lines at the
      -- bottom of the screen. We intentionally leave the
      -- last line blank by pressing <c-e> so the user has a
      -- clue that they are near the end of the file.
      vim.cmd([[execute "normal! \G'\"\<c-e>"]])
    end
  end
  if fn.foldclosed(".") ~= -1 and open_fold then
    -- if we're in a fold, make the current line visible and recenter screen
    fn.execute("normal! zvzz")
  end
end

function Lastplace.setup()
  local api = vim.api
  local lastplace_augroup = api.nvim_create_augroup("LastPlace", { clear = true })
  api.nvim_create_autocmd("BufWinEnter", { callback = find, group = lastplace_augroup })
end

return Lastplace
