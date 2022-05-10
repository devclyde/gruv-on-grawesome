local M = {}

M.ui = {
  theme = require('profiles.default.themes.awesome'),
}

M.cached = {
  require('profiles.default.widgets.awesome-menu'),
  require('profiles.default.widgets.main-menu'),
  require('profiles.default.widgets.launcher'),
}

M.signals = {
  require('profiles.default.signals.naughty.display-error'),
  require('profiles.default.signals.naughty.display'),

  require('profiles.default.signals.awesome.post-setup'),

  require('profiles.default.signals.tag.default-layout'),

  require('profiles.default.signals.ruled.notification.rules'),
  require('profiles.default.signals.ruled.client.rules'),

  require('profiles.default.signals.client.default-keybindings'),
  require('profiles.default.signals.client.default-mousebindings'),
  require('profiles.default.signals.client.sloppy-focus'),
  require('profiles.default.signals.client.titlebars'),

  require('profiles.default.signals.screen.wallpaper'),
  require('profiles.default.signals.screen.desktop-decoration'),
}

M.mappings = {
  global = {
    keyboard = {
      require('profiles.default.bindings.global.keyboard.general-related'),
      require('profiles.default.bindings.global.keyboard.tag-related'),
      require('profiles.default.bindings.global.keyboard.focus-related'),
      require('profiles.default.bindings.global.keyboard.layout-related'),
      require('profiles.default.bindings.global.keyboard.__group-tag-related'),
    },
    mouse = {
      require('profiles.default.bindings.global.mouse.general-related')
    }
  },
  client = {
    keyboard = {
      require('profiles.default.bindings.client.keyboard.general-related')
    },
    mouse = {
      require('profiles.default.bindings.client.mouse.general-related')
    }
  }
}

return M
