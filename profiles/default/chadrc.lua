local M = {}

M.signals = {
  require('profiles.default.signals.naughty.display-error'),
  require('profiles.default.signals.naughty.display'),

  require('profiles.default.signals.tag.default-layout')
}

return M
