local awful = require('awful')
local beautiful = require('beautiful')

local awesome_menu = require('profiles.default.widgets.awesome-menu')

local M = {}

M.create = function ()
  return awful.menu({
    items = {
      {
        "awesome", awesome_menu.create(),
        beautiful.awesome_icon
      },
      {
        "open terminal", 'alacritty'
      }
    }
  })
end

return M
