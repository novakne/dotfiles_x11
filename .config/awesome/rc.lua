-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
require("awful.autofocus")


-- Configurations
local startup = require("config.startup")
startup.init()
require("config.notifications")
require("config.keys")
require("config.rules")
require("config.signals")
require("config.tags")
local titlebar = require("config.titlebar")
titlebar.init()

-- Theme
require("config.env")
require("config.wallpaper")

-- Panels
require("layouts.panels")

-- Enable for lower memory consumption
-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)
-- collectgarbage("setpause", 110)
-- collectgarbage("setstepmul", 1000)
