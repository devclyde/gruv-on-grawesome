local ruled = require('ruled')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function()
  return ruled
end

M.get_address = function()
  return 'request::rules'
end

M.on_trigger = function ()
  ruled.notification.append_rule {
    rule = {
      urgency = 'critical'
    },
    properties = {
      bg = '#ff0000',
      fg = '#ffffff'
    }
  }
end

return M
