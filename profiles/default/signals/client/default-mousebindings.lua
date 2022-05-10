local awful = require('awful')

local M = {}

M.data = {
  resolve_dependencies = true,
  dependencies = {
    ['__chadrc'] = {}
  }
}

M.get_host = function ()
  return client
end

M.get_address = function ()
  return 'request::default_mousebindings'
end

M.on_trigger = function ()
  local mousebindings = M.data.dependencies.__chadrc.mappings.client.mouse

  for _, group in ipairs(mousebindings) do
    if _ ~= yambar.table.count_keys(mousebindings) then
      assert(type(group.create) == 'function', '`group::create` must be a function')

        for _, mousebinding in ipairs(group.create()) do
          awful.mouse.append_client_mousebinding(mousebinding)
        end
    end
  end
end

return M
