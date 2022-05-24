local awful = require('awful')

local M = {}

M.create = function ()
  return {
    awful.key({ AWCHAD_MODIFIER }, 'f',
      function (client)
        client.fullscreen = not client.fullscreen
        client:raise()
      end,
      {
        description = 'toggle fullscreen',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Shift' }, 'c',
      function (client)
        client:kill()
      end,
      {
        description = 'close',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Control' }, 'space',
      awful.client.floating.toggle                     ,
      {
        description = 'toggle floating',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Control' }, 'Return',
      function (client)
        client:swap(awful.client.getmaster())
      end,
      {
        description = 'move to master',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'o',
      function (client)
        client:move_to_screen()
      end,
      {
        description = 'move to screen',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 't',
      function (client)
        client.ontop = not client.ontop
      end,
      {
        description = 'toggle keep on top',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'n',
      function (c)
        c.minimized = true
      end ,
      {
        description = 'minimize',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'm',
      function (client)
        client.maximized = not client.maximized
        client:raise()
      end ,
      {
        description = '(un)maximize',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Control' }, 'm',
      function (client)
        client.maximized_vertical = not client.maximized_vertical
        client:raise()
      end ,
      {
        description = '(un)maximize vertically',
        group = 'client'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Shift' }, 'm',
      function (client)
        client.maximized_horizontal = not client.maximized_horizontal
        client:raise()
      end ,
      {
        description = '(un)maximize horizontally',
        group = 'client'
      }
    ),
  }
end

return M
