local naughty = require('naughty')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function()
  return naughty
end

M.get_address = function()
  return 'request::display_error'
end

M.on_trigger = function (message, startup)
  naughty.notification {
    urgency = 'critical',
    title = 'Oops, an error happened' .. (startup and ' during startup!' or '!'),
    message = message
  }
end

return M
