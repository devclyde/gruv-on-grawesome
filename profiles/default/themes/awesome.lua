local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')

local themes_dir = yambar.filesystem.get_themes_dir()

local R = {}

R.font = 'sans 8'

R.bg_normal   = '#222222'
R.bg_focus    = '#535d6c'
R.bg_urgent   = '#ff0000'
R.bg_minimize = '#444444'
R.bg_systray  = R.bg_normal

R.fg_normal   = '#aaaaaa'
R.fg_focus    = '#ffffff'
R.fg_urgent   = '#ffffff'
R.fg_minimize = '#ffffff'

R.useless_gap         = xresources.apply_dpi(0)
R.border_width        = xresources.apply_dpi(1)
R.border_color_normal = '#000000'
R.border_color_active = '#535d6c'
R.border_color_marked = '#91231c'

local taglist_square_size = xresources.apply_dpi(4)
R.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, R.fg_normal
)
R.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, R.fg_normal
)

R.menu_submenu_icon = themes_dir .. 'default/submenu.png'
R.menu_height = xresources.apply_dpi(15)
R.menu_width  = xresources.apply_dpi(100)

R.titlebar_close_button_normal = themes_dir ..'default/titlebar/close_normal.png'
R.titlebar_close_button_focus  = themes_dir ..'default/titlebar/close_focus.png'

R.titlebar_minimize_button_normal = themes_dir ..'default/titlebar/minimize_normal.png'
R.titlebar_minimize_button_focus  = themes_dir ..'default/titlebar/minimize_focus.png'

R.titlebar_ontop_button_normal_inactive = themes_dir .. 'default/titlebar/ontop_normal_inactive.png'
R.titlebar_ontop_button_focus_inactive  = themes_dir .. 'default/titlebar/ontop_focus_inactive.png'
R.titlebar_ontop_button_normal_active = themes_dir .. 'default/titlebar/ontop_normal_active.png'
R.titlebar_ontop_button_focus_active  = themes_dir .. 'default/titlebar/ontop_focus_active.png'

R.titlebar_sticky_button_normal_inactive = themes_dir .. 'default/titlebar/sticky_normal_inactive.png'
R.titlebar_sticky_button_focus_inactive  = themes_dir .. 'default/titlebar/sticky_focus_inactive.png'
R.titlebar_sticky_button_normal_active = themes_dir .. 'default/titlebar/sticky_normal_active.png'
R.titlebar_sticky_button_focus_active  = themes_dir .. 'default/titlebar/sticky_focus_active.png'

R.titlebar_floating_button_normal_inactive = themes_dir .. 'default/titlebar/floating_normal_inactive.png'
R.titlebar_floating_button_focus_inactive  = themes_dir .. 'default/titlebar/floating_focus_inactive.png'
R.titlebar_floating_button_normal_active = themes_dir .. 'default/titlebar/floating_normal_active.png'
R.titlebar_floating_button_focus_active  = themes_dir .. 'default/titlebar/floating_focus_active.png'

R.titlebar_maximized_button_normal_inactive = themes_dir .. 'default/titlebar/maximized_normal_inactive.png'
R.titlebar_maximized_button_focus_inactive  = themes_dir .. 'default/titlebar/maximized_focus_inactive.png'
R.titlebar_maximized_button_normal_active = themes_dir .. 'default/titlebar/maximized_normal_active.png'
R.titlebar_maximized_button_focus_active  = themes_dir .. 'default/titlebar/maximized_focus_active.png'

R.wallpaper = themes_dir .. 'default/background.png'

R.layout_fairh = themes_dir .. 'default/layouts/fairhw.png'
R.layout_fairv = themes_dir .. 'default/layouts/fairvw.png'
R.layout_floating  = themes_dir ..'default/layouts/floatingw.png'
R.layout_magnifier = themes_dir ..'default/layouts/magnifierw.png'
R.layout_max = themes_dir .. 'default/layouts/maxw.png'
R.layout_fullscreen = themes_dir ..'default/layouts/fullscreenw.png'
R.layout_tilebottom = themes_dir ..'default/layouts/tilebottomw.png'
R.layout_tileleft   = themes_dir ..'default/layouts/tileleftw.png'
R.layout_tile = themes_dir .. 'default/layouts/tilew.png'
R.layout_tiletop = themes_dir .. 'default/layouts/tiletopw.png'
R.layout_spiral  = themes_dir .. 'default/layouts/spiralw.png'
R.layout_dwindle = themes_dir .. 'default/layouts/dwindlew.png'
R.layout_cornernw = themes_dir .. 'default/layouts/cornernww.png'
R.layout_cornerne = themes_dir .. 'default/layouts/cornernew.png'
R.layout_cornersw = themes_dir .. 'default/layouts/cornersww.png'
R.layout_cornerse = themes_dir .. 'default/layouts/cornersew.png'

R.awesome_icon = theme_assets.awesome_icon(
    R.menu_height, R.bg_focus, R.fg_focus
)

R.icon_theme = nil

return R
