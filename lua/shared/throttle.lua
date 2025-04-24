local Throttle = {}

function Throttle.throttle_wrap(fn, timeout)
  local last_call = 0
  local timer = vim.uv.new_timer()

  return function(...)
    local now = vim.uv.now()
    local args = { ... }
    if now - last_call >= timeout then
      last_call = now
      vim.schedule(function()
        fn(unpack(args))
      end)
    else
      timer:stop()
      timer:start(timeout - (now - last_call), 0, function()
        timer:stop()
        last_call = vim.uv.now()
        vim.schedule(function()
          fn(unpack(args))
        end)
      end)
    end
  end
end

return Throttle
