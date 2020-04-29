local gfs = require("gears.filesystem")
local beautiful = require("beautiful")


local env = {
  themes = {
    "aize",       -- 1
    "aize_black", -- 2
  },
  rofi_themes = {
    "full", -- 1
    "dock", -- 2
    "vert", -- 3
  },
  tag_icons_colors = {
    "green",  -- 1
    "yellow", -- 2
  },
  terminal = "alacritty",
  editor   = "nvim",
  browser  = "vivaldi-stable",
}

-- Theme
local chosen_theme = env.themes[2]
beautiful.init(gfs.get_configuration_dir() .."themes/"..chosen_theme.."/theme.lua")
-- Taglist icons
env.icons_color = env.tag_icons_colors[2]

-- Rofi
local rofi_dir = gfs.get_configuration_dir().."themes/".. chosen_theme .. "/rofi/"
local rofi_theme = env.rofi_themes[3]

local fmt = ""
if rofi_theme == env.rofi_themes[1] then
  fmt = "rofi -normal-window -modi drun -show drun -theme %sapp_drawer_%s.rasi"
else
  fmt = "rofi -no-lazy-grab -show drun -theme %sapp_drawer_%s.rasi"
end

env.launcher = fmt:format(rofi_dir, rofi_theme)
env.power_menu = gfs.get_configuration_dir() .. "layouts/power_menu/power_menu"


return env
