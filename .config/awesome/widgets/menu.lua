local awful = require("awful")
local beautiful = require("beautiful")
local env = require("config.env")
-- TODO This is file is not sourced for now

-- Create a launcher widget and a main menu
local myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", env.terminal .. " -e man awesome" },
  { "edit config", env.editor .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
      { "open terminal", env.terminal }
    }
  })

local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
  menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = env.terminal -- Set the terminal for applications that require it

-- {{{ Mouse bindings
-- awful.mouse.append_global_mousebindings({
--     awful.button({ }, 3, function () mymainmenu:toggle() end),
--     awful.button({ }, 4, awful.tag.viewnext),
--     awful.button({ }, 5, awful.tag.viewprev),
-- })

