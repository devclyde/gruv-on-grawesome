local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function ()
  return awesome
end

M.get_address = function ()
  return 'awchad::post_setup'
end

M.on_trigger = function ()
  yambar.logger.info('setup complete')

  require('awful.autofocus')
  require('awful.hotkeys_popup.keys')
end

return M
