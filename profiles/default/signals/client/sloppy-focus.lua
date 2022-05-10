local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function()
  return client
end

M.get_address = function()
  return 'request::enter'
end

M.on_trigger = function (client)
  client:activate {
    context = 'mouse_enter',
    raise = false
  }
end

return M
