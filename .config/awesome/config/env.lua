local gfs = require("gears.filesystem")
local beautiful = require("beautiful")
local config_dir = gfs.get_configuration_dir()


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
  taskmanager = "alacritty -e htop"
}

-- Theme
local chosen_theme = env.themes[2]
beautiful.init(config_dir.."themes/"..chosen_theme.."/theme.lua")
-- Taglist icons
env.icons_color = env.tag_icons_colors[2]

-- Rofi
local rofi_dir   = config_dir.."themes/"..chosen_theme.."/rofi/"
local rofi_theme = env.rofi_themes[3]
local rofi_cmd   = "rofi -no-lazy-grab -show drun -theme %sapp_drawer_%s.rasi"

if rofi_theme == env.rofi_themes[1] then
  rofi_cmd = "rofi -normal-window -show drun -theme %sapp_drawer_%s.rasi"
end

env.launcher = rofi_cmd:format(rofi_dir, rofi_theme)
env.power_menu = config_dir.."layouts/power_menu/power_menu"


return env
