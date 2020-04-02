local awful = require("awful")
local left_panel = require("layouts.panels.left_panel")

awful.screen.connect_for_each_screen(function(s)
  -- Init panels
  left_panel(s)
end)
