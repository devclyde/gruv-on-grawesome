local awful = require('awful')
local beautiful = require('beautiful')

local awesome_menu = require('profiles.default.widgets.awesome-menu')

local M = {}

M.data = {
  resolve_dependencies = true,
  dependencies = {
    ['__widget_awesome_menu'] = {}
  },
  injection = {
    name = '__widget_main_menu',
    type = 'widget'
  },
}

M.create = function ()
  return awful.menu({
    items = {
      {
        "awesome", M.data.dependencies.__widget_awesome_menu,
        beautiful.awesome_icon
      },
      {
        "open terminal", 'alacritty'
      }
    }
  })
end

return M
