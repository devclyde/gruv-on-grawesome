local awful = require('awful')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function ()
  return tag
end

M.get_address = function ()
  return 'request::default_layouts'
end

M.on_trigger = function ()
  awful.layout.append_default_layouts({
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
  })
end

return M
