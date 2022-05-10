local awful = require('awful')

local M = {}

M.create = function ()
  return {
    awful.key {
      modifiers = { AWCHAD_MODIFIER },
      keygroup = 'numrow',
      description = 'only view tag',
      group = 'tag',
      on_press = function (index)
        local screen = awful.screen.focused()
        local tag = screen.tags[index]

        if tag then
          tag:view_only()
        end
      end,
    },
    awful.key {
      modifiers = { AWCHAD_MODIFIER, 'Control' },
      keygroup = 'numrow',
      description = 'toggle tag',
      group = 'tag',
      on_press = function (index)
        local screen = awful.screen.focused()
        local tag = screen.tags[index]

        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
    },
    awful.key {
      modifiers = { AWCHAD_MODIFIER, 'Shift' },
      keygroup = 'numrow',
      description = 'move focused client to tag',
      group = 'tag',
      on_press = function (index)
        if client.focus then
          local tag = client.focus.screen.tags[index]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
    },
    awful.key {
      modifiers = { AWCHAD_MODIFIER, 'Control', 'Shift' },
      keygroup = 'numrow',
      description = 'toggle focused client on tag',
      group = 'tag',
      on_press = function (index)
        if client.focus then
          local tag = client.focus.screen.tags[index]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
    },
    awful.key {
      modifiers   = { AWCHAD_MODIFIER },
      keygroup    = 'numpad',
      description = 'select layout directly',
      group       = 'layout',
      on_press    = function (index)
        local tag = awful.screen.focused().selected_tag
        if tag then
          tag.layout = tag.layouts[index] or tag.layout
        end
      end,
    }
  }
end

return M
