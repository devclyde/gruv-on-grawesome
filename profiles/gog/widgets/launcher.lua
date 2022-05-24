local awful = require('awful')
local beautiful = require('beautiful')

local main_menu = require('profiles.gog.widgets.main-menu')

local M = {}

M.data = {
  resolve_dependencies = true,
  dependencies = {
    ['__widget_main_menu'] = {},
  },
  injection = {
    name = '__widget_launcher',
    type = 'widget'
  }
}

M.create = function ()
  return awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = main_menu.create()
  })
end

return M
