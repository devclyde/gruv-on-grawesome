local awful = require('awful')

local M = {}

M.create = function ()
  return {
    awful.button({ }, 1,
      function (client)
        client:activate {
          context = 'mouse_click'
        }
      end
    ),
    awful.button({ AWCHAD_MODIFIER }, 1,
      function (client)
        client:activate {
          context = 'mouse_click',
          action = 'mouse_move'
        }
      end
    ),
    awful.button({ AWCHAD_MODIFIER }, 3,
      function (client)
        client:activate {
          context = 'mouse_click',
          action = 'mouse_resize'
        }
      end
    ),
  }
end

return M
