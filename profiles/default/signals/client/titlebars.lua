local awful = require('awful')
local wibox = require('wibox')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function()
  return client
end

M.get_address = function()
  return 'request::titlebars'
end

M.on_trigger = function (client)
  local buttons = {
    awful.button({ }, 1,
      function()
        client:activate {
          context = 'titlebar',
          action = 'mouse_move'
        }
      end
    ),
    awful.button({ }, 3,
      function()
        client:activate {
          context = 'titlebar',
          action = 'mouse_resize'
        }
      end
    ),
  }

  awful.titlebar(client).widget = {
    { -- Left
      awful.titlebar.widget.iconwidget(client),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = 'center',
        widget = awful.titlebar.widget.titlewidget(client)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(client),
      awful.titlebar.widget.maximizedbutton(client),
      awful.titlebar.widget.stickybutton(client),
      awful.titlebar.widget.ontopbutton(client),
      awful.titlebar.widget.closebutton(client),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end

return M
