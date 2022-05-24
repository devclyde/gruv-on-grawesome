local naughty = require('naughty')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function ()
  return naughty
end

M.get_address = function ()
  return 'request::display'
end

M.on_connect = function ()
  yambar.logger.info('hello, world!')
end

M.on_trigger = function (notification)
  naughty.layout.box {
    notification = notification
  }
end

return M
