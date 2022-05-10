local awful = require('awful')
local beautiful = require('beautiful')

local main_menu = require('profiles.default.widgets.main-menu')

local M = {}

M.create = function ()
  return awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = main_menu.create()
  })
end

return M
