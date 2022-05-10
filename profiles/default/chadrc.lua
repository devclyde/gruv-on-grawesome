local M = {}

M.ui = {
  theme = require('profiles.default.themes.awesome')
}

M.signals = {
  require('profiles.default.signals.naughty.display-error'),
  require('profiles.default.signals.naughty.display'),

  require('profiles.default.signals.tag.default-layout'),

  require('profiles.default.signals.ruled.notification.rules'),

  require('profiles.default.signals.screen.wallpaper'),
  require('profiles.default.signals.screen.desktop-decoration')
}

return M
