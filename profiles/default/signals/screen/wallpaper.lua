local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function ()
  return screen
end

M.get_address = function ()
  return 'request::wallpaper'
end

---@param screen table
M.on_trigger = function (screen)
  awful.wallpaper {
    screen = screen,
    widget = {
      {
        image = beautiful.wallpaper,
        upscale = true,
        downscale = true,
        widget = wibox.widget.imagebox
      },
      valign = 'center',
      halign = 'center',
      tiled = false,
      widget = wibox.container.tile
    }
  }
end

return M
