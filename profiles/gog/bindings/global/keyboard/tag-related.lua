local awful = require('awful')

local M = {}

M.create = function ()
  return {
    awful.key({ AWCHAD_MODIFIER }, 'Left',
      awful.tag.viewprev,
      {
        description = 'view previous',
        group = 'tag'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'Right',
      awful.tag.viewnext,
      {
        description = 'view next',
        group = 'tag'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'Escape',
      awful.tag.history.restore,
      {
        description = 'go back',
        group = 'tag'
      }
    ),
  }
end

return M
