-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
-- local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- Configurations
require("configuration.keys")
require("configuration.notifications")
require("configuration.rules")
require("configuration.signals")
require("configuration.tags")
require("configuration.titlebar").init()

-- Themes
local themes = {
  "aize" -- 1
}
local chosen_theme = themes[1]

beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/" .. chosen_theme .. "/theme.lua")
require("configuration.wallpaper")

-- Panels
require("layouts.panels")

-- Enable for lower memory consumption
-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)
-- collectgarbage("setpause", 110)
-- collectgarbage("setstepmul", 1000)
