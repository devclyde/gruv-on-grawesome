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
  return 'request::default_keybindings'
end

M.on_trigger = function ()
  local keybindings = M.data.dependencies.__chadrc.mappings.client.keyboard

  for _, group in ipairs(keybindings) do
    if _ ~= yambar.table.count_keys(keybindings) then
      assert(type(group.create) == 'function', '`group::create` must be a function')

        for _, keybinding in ipairs(group.create()) do
          awful.keyboard.append_client_keybinding(keybinding)
        end
    end
  end
end

return M
