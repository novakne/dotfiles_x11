local gears = require("gears")
local gfs = require("gears.filesystem")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = gfs.get_configuration_dir() .. "/themes/aize/"

local theme = {}

-- Colors Variables
theme.white   = "#d2ccd6"
theme.white_2 = "#b7acbf"
theme.black   = "#29223a"
theme.black_2 = "#534666"
theme.black_3 = "#6b5c7c"
theme.red     = "#f63d81"
theme.pink    = "#fc65b0"
theme.orange  = "#f5939c"
theme.yellow  = "#e8ec77"
theme.green   = "#2dcbb0"
theme.blue    = "#57bbf4"
theme.magenta = "#a89bee"
theme.cyan    = "#4db9c8"


-- General
theme.font        = "Inter 11"
theme.wallpaper   = themes_path .. "wal_coffee.jpg"
theme.icon_theme  = "/usr/share/icons/Papirus"
theme.useless_gap = dpi(6)
theme.gap_single_client = false

-- Background
theme.bg_normal     = theme.black
theme.bg_focus      = theme.black_2
theme.bg_urgent     = theme.black_2
theme.bg_minimize   = theme.black_2

-- Foreground
theme.fg_normal     = theme.white_2
theme.fg_focus      = theme.white
theme.fg_urgent     = theme.pink
theme.fg_minimize   = theme.white

-- Border
theme.border_width        = dpi(2)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.pink
theme.border_marked       = theme.pink
theme.fullscreen_hide_border = true
theme.maximized_hide_border  = true

-- Hotkeys
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = "Inter 12"

-- Notifications
theme.notification_font = "Inter 13"
theme.notification_position = "top_right"
theme.notification_opacity = 1
theme.notification_icon_size = dpi(40)

theme.notification_border_width = dpi(0)
theme.notification_border_radius = theme.border_radius
theme.notification_border_color = theme.pink

theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_crit_bg = theme.pink
theme.notification_crit_fg = theme.bg_normal

theme.notification_margin = dpi(16)
theme.notification_padding = dpi(3)
theme.notification_spacing = dpi(3)
theme.notification_max_width = dpi(400)
theme.notification_min_width = dpi(200)

-- Systemtray
theme.systray_icon_spacing = dpi(1)
theme.bg_systray = theme.bg_normal

-- Taglist
theme.taglist_bg_empty    = theme.bg_normal
theme.taglist_bg_occupied = theme.bg_focus
theme.taglist_bg_urgent   = theme.fg_urgent
theme.taglist_bg_focus    = theme.black_3

-- Tasklist
theme.tasklist_font = theme.font

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus  = theme.bg_focus
theme.tasklist_bg_urgent = theme.bg_urgent

theme.tasklist_fg_focus  = theme.fg_focus
theme.tasklist_fg_urgent = theme.fg_urgent
theme.tasklist_fg_normal = theme.fg_normal

theme.tasklist_align = "center"
theme.tasklist_margin = dpi(12)
theme.tasklist_spacing = dpi(0)

-- Titlebars
theme.titlebar_font     = theme.font
theme.titlebar_bg       = theme.bg_normal
theme.titlebar_bg_focus = theme.titlebar_bg

-- Tooltip
theme.tooltip_font = "Inter 13"
theme.tooltip_shape = gears.shape.rounded_rect

-- Wibar
theme.wibar_bg = theme.bg_normal


-- ICONS

-- Layout
theme.layout_tile     = themes_path .. "layouts/tile.svg"
theme.layout_tileleft = themes_path .. "layouts/tileleft.svg"
theme.layout_floating = themes_path .. "layouts/floating.svg"
theme.layout_max      = themes_path .. "layouts/max.svg"

-- Titlebar
theme.titlebar_close_button_normal = themes_path.."titlebar/close_normal.svg"
theme.titlebar_close_button_focus  = themes_path.."titlebar/close_focus.svg"

theme.titlebar_minimize_button_normal = themes_path.."titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = themes_path.."titlebar/minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = themes_path.."titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."titlebar/maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."titlebar/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."titlebar/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = themes_path.."titlebar/maximized_focus_active.svg"


return theme
