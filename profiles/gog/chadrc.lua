local M = {}

M.ui = {
  theme = require('profiles.gog.themes.awesome'),
}

M.cached = {
  require('profiles.gog.widgets.awesome-menu'),
  require('profiles.gog.widgets.main-menu'),
  require('profiles.gog.widgets.launcher'),
}

M.signals = {
  require('profiles.gog.signals.naughty.display-error'),
  require('profiles.gog.signals.naughty.display'),

  require('profiles.gog.signals.awesome.post-setup'),

  require('profiles.gog.signals.tag.default-layout'),

  require('profiles.gog.signals.ruled.notification.rules'),
  require('profiles.gog.signals.ruled.client.rules'),

  require('profiles.gog.signals.client.default-keybindings'),
  require('profiles.gog.signals.client.default-mousebindings'),
  require('profiles.gog.signals.client.sloppy-focus'),
  require('profiles.gog.signals.client.titlebars'),

  require('profiles.gog.signals.screen.wallpaper'),
  require('profiles.gog.signals.screen.desktop-decoration'),
}

M.mappings = {
  global = {
    keyboard = {
      require('profiles.gog.bindings.global.keyboard.general-related'),
      require('profiles.gog.bindings.global.keyboard.tag-related'),
      require('profiles.gog.bindings.global.keyboard.focus-related'),
      require('profiles.gog.bindings.global.keyboard.layout-related'),
      require('profiles.gog.bindings.global.keyboard.__group-tag-related'),
    },
    mouse = {
      require('profiles.gog.bindings.global.mouse.general-related')
    }
  },
  client = {
    keyboard = {
      require('profiles.gog.bindings.client.keyboard.general-related')
    },
    mouse = {
      require('profiles.gog.bindings.client.mouse.general-related')
    }
  }
}

return M
