local awful = require('awful')
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')

local M = {}

M.data = {
  resolve_dependencies = true,
  dependencies = {
    ['__widget_main_menu'] = {}
  }
}

M.create = function ()
  return {
    awful.key({ AWCHAD_MODIFIER }, 's',
      hotkeys_popup.show_help,
      {
        description = 'show help',
        group = 'awesome'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'w',
      function ()
        M.data.dependencies.__widget_main_menu:show()
      end,
      {
        description = 'show main menu',
        group = 'awesome'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Control' }, 'r',
      awesome.restart,
      {
        description = 'reload awesome',
        group = 'awesome'
      }
    ),
    awful.key({ AWCHAD_MODIFIER, 'Shift' }, 'q',
      awesome.quit,
      {
        description = 'quit awesome',
        group = 'awesome'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'x',
      function ()
        awful.prompt.run {
          prompt = 'Run Lua code: ',
          textbox = awful.screen.focused().my_prompt_box.widget,
          exe_callback = awful.util.eval,
          history_path = awful.util.get_cache_dir() .. '/history_eval'
        }
      end,
      {
        description = 'lua execute prompt',
        group = 'awesome'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'Return',
      function ()
        awful.spawn('alacritty')
      end,
      {
        description = 'open a terminal',
        group = 'launcher'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'r',
      function ()
        awful.screen.focused().my_prompt_box:run()
      end,
      {
        description = 'run prompt',
        group = 'launcher'
      }
    ),
    awful.key({ AWCHAD_MODIFIER }, 'p',
      function()
        menubar.show()
      end,
      {
        description = 'show the menubar',
        group = 'launcher'
      }
    ),
  }
end

return M
