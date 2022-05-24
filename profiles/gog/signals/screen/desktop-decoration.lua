local awful = require('awful')
local wibox = require('wibox')

local launcher = require('profiles.gog.widgets.launcher')

local M = {}

M.data = {
  resolve_dependencies = false
}

M.get_host = function ()
  return screen
end

M.get_address = function ()
  return 'request::desktop_decoration'
end

---@param screen table
M.on_trigger = function (screen)
  awful.tag({ "main", "www", "dev", "term", "chat", "music" }, screen, awful.layout.layouts[1])

  local my_keyboard_layout = awful.widget.keyboardlayout()
  local my_text_clock = wibox.widget.textclock()
  local my_launcher = launcher.create()

  screen.my_prompt_box = awful.widget.prompt()
  screen.my_layout_box = awful.widget.layoutbox {
    screen = screen,
    buttons = {
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end),
      awful.button({ }, 4, function () awful.layout.inc(-1) end),
      awful.button({ }, 5, function () awful.layout.inc( 1) end),
    }
  }
  screen.my_tag_list = awful.widget.taglist {
    screen = screen,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({ }, 1,
        function(tag)
          tag:view_only()
        end
      ),
      awful.button({ AWCHAD_MODIFIER }, 1,
        function(tag)
          if client.focus then
            client.focus:move_to_tag(tag)
          end
        end
      ),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ AWCHAD_MODIFIER }, 3,
        function(tag)
          if client.focus then
            client.focus:toggle_tag(tag)
          end
        end
      ),
      awful.button({ }, 4,
        function(tag)
          awful.tag.viewprev(tag.screen)
        end
      ),
      awful.button({ }, 5,
        function(tag)
          awful.tag.viewnext(tag.screen)
        end
      ),
    }
  }
  screen.my_task_list = awful.widget.tasklist {
    screen  = screen,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({ }, 1,
        function (c)
          c:activate {
            context = "tasklist",
            action = "toggle_minimization"
          }
        end
      ),
      awful.button({ }, 3,
        function()
          awful.menu.client_list {
            theme = {
              width = 250
            }
          }
        end
      ),
      awful.button({ }, 4,
        function()
          awful.client.focus.byidx(-1)
        end
      ),
      awful.button({ }, 5,
        function()
          awful.client.focus.byidx(1)
        end
      ),
    }
  }
  screen.my_wibox = awful.wibar {
    screen = screen,
    position = 'top',
    widget = {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        my_launcher,
        screen.my_tag_list,
        screen.my_prompt_box,
      },
      screen.my_task_list, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        my_keyboard_layout,
        wibox.widget.systray(),
        my_text_clock,
        screen.my_layout_box,
      },
    }
  }
end

return M
