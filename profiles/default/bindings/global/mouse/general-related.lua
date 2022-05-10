local awful = require('awful')

local M = {}

M.create = function ()
  return {
    awful.button({ }, 3,
      function ()
        -- mymainmenu:toggle()
      end
    ),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
  }
end

return M
