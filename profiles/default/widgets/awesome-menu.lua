local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')

local M = {}

M.create = function ()
  return {
    { "hotkeys",
      function()
        hotkeys_popup.show_help(nil, awful.screen.focused())
      end
    },
    { "manual", 'alacritty' .. " -e man awesome" },
    { "edit config", string.format('alacritty -e %s', 'nvim') .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }
end

return M
