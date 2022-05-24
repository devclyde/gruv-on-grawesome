local awful = require('awful')

local M = {}

M.data = {
  resolve_dependencies = true,
  dependencies = {
    ['__widget_main_menu'] = {}
  }
}

M.create = function ()
  return {
    awful.button({ }, 3,
      function ()
        M.data.dependencies.__widget_main_menu:toggle()
      end
    ),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
  }
end

return M
