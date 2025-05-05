local Debounce = {}

function Debounce.debounce_wrap(fn, timeout)
  local is_queued = false

  return function(...)
    if is_queued then
      return
    end

    is_queued = true
    local args = { ... }

    vim.defer_fn(function()
      fn(unpack(args))
      is_queued = false
    end, timeout)
  end
end

return Debounce
