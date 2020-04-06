local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local naughty = require("naughty")
-- Enable hotkeys help widget for VIM and other apps
-- -- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

-- Default Applications
local apps = require("configuration.apps");
local screenshot = require("utils.screenshot")

-- Define mod key
local modkey = "Mod4"
local altkey = "Mod1"

local keys = {}


-- Mouse bindings
-- Mouse buttons on the desktop
keys.desktopbuttons = gears.table.join(
  -- left click on desktop to hide notification
  awful.button({}, 1,
    function()
      naughty.destroy_all_notifications()
    end
    )
  )

-- Mouse buttons on the client
keys.clientbuttons = gears.table.join(
  awful.button({}, 1,
    function(c)
      client.focus = c
      c:raise()
    end),
  awful.button({modkey}, 1, awful.mouse.client.move),
  awful.button({modkey}, 3, awful.mouse.client.resize)
  )

-- Key bindings
keys.globalkeys = gears.table.join(

  -- APPLICATION KEY BINDINGS
  -- Spawn terminal
  awful.key({ modkey }, "Return",
    function()
      awful.spawn(apps.terminal)
    end,
    {description = "open a terminal", group = "launcher"}),

  awful.key({"Control", "Shift"}, "Return",
    function()
      awful.spawn(apps.terminal)
    end,
    {description = "open a terminal", group = "launcher"}),

  -- Launch rofi
  awful.key({ modkey }, "d",
    function()
      awful.spawn(apps.launcher)
    end,
    {description = "application launcher", group = "launcher"}),

  -- Launch browser
  awful.key({ modkey }, "v",
    function()
      awful.spawn(apps.browser)
    end,
    {description = "launch browser", group = "launcher"}),

  -- Brightness
  -- Increase
  awful.key({}, 'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10')
      -- if toggleBriOSD ~= nil then
      --   toggleBriOSD(true)
      -- end
      -- if UpdateBrOSD ~= nil then
      --   UpdateBriOSD()
      -- end
    end,
    {description = '+10%', group = 'brightness'}),

  -- Decrease
  awful.key({}, 'XF86MonBrightnessDown',
    function()
      -- awful.spawn('xbacklight -dec 10')
      -- if toggleBriOSD ~= nil then
      --   toggleBriOSD(true)
      -- end
      -- if UpdateBrOSD ~= nil then
      --   UpdateBriOSD()
      -- end
    end,
    {description = '-10%', group = 'brightness'}),

  -- Volume
  -- Raise
  awful.key({}, 'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
      -- if toggleVolOSD ~= nil then
      --   toggleVolOSD(true)
      -- end
      -- if UpdateVolOSD ~= nil then
      --   UpdateVolOSD()
      -- end
    end,
    {description = '+5%', group = 'volume'}),

  -- Lower
  awful.key({}, 'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
      -- if toggleVolOSD ~= nil then
      --   toggleVolOSD(true)
      -- end
      -- if UpdateVolOSD ~= nil then
      --   UpdateVolOSD()
      -- end
    end,
    {description = '-5%', group = 'volume'}),

  -- Mute
  awful.key({}, 'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'mute', group = 'volume'}),

  -- Screenshot with maim
  -- Full screen
  awful.key({}, "Print",
    function()
      screenshot.full()
    end,
    {description = "fullscreen", group = "screenshot"}),

  -- Selection
  awful.key({ modkey }, "Print",
    function()
      screenshot.selection()
    end,
    {description = "select a zone", group = "screenshot"}),

  -- Click
  awful.key({ modkey, "Shift" }, "Print",
    function()
      screenshot.click()
    end,
    {description = "click on a window", group = "screenshot"}),


  -- Toggle systray
  awful.key({ modkey }, "=",
    function()
      awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
    end,
    {description = "toggle visibility", group = "systray"}),


  -- Awesome
  -- Reload Awesome
  awful.key({ modkey, "Shift" }, "r",
    awesome.restart,
    {description = "reload awesome", group = "awesome"}),

  -- Quit Awesome
  awful.key({ modkey }, "Escape",
    function()
      awful.spawn.with_shell(apps.power_menu)
    end,
    {description = "power menu", group = "awesome"}),

  awful.key({}, 'XF86PowerOff',
    function()
      awful.spawn.with_shell(apps.power_menu)
    end,
    {description = 'power menu', group = 'awesome'}),

  -- Show help
  awful.key({ modkey }, "s",
    hotkeys_popup.show_help,
    {description="show help", group="awesome"}),


  -- Gap
  -- Increment
  awful.key({ modkey, "Shift" }, "minus",
    function()
      awful.tag.incgap(5, nil)
    end,
    {description = "increment gaps size for the current tag", group = "gap"}),

  -- Decrement
  awful.key({ modkey }, "minus",
    function()
      awful.tag.incgap(-5, nil)
    end,
    {description = "decrement gap size for the current tag", group = "gap"}),


  -- Layouts
  -- Resizing
  -- Increase
  awful.key({ modkey }, "l",
    function()
      awful.tag.incmwfact( 0.05)
    end,
    {description = "increase master width factor", group = "layout"}),

  -- Decrease
  awful.key({ modkey }, "h",
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = "decrease master width factor", group = "layout"}),

  -- Number of master clients
  awful.key({ modkey, altkey }, "h",
    function()
      awful.tag.incnmaster( 1, nil, true)
    end,
    {description = "increase the number of master clients", group = "layout"}),

  awful.key({ modkey, altkey }, "l",
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = "decrease the number of master clients", group = "layout"}),

  awful.key({ modkey, altkey }, "Left",
    function()
      awful.tag.incnmaster( 1, nil, true)
    end,
    {description = "increase the number of master clients", group = "layout"}),

  awful.key({ modkey, altkey }, "Right",
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = "decrease the number of master clients", group = "layout"}),

  -- Number of columns
  awful.key({ modkey, altkey }, "k",
    function()
      awful.tag.incncol( 1, nil, true)
    end,
    {description = "increase the number of columns", group = "layout"}),

  awful.key({ modkey, altkey }, "j",
    function()
      awful.tag.incncol( -1, nil, true)
    end,
    {description = "decrease the number of columns", group = "layout"}),

  awful.key({ modkey, altkey }, "Up",
    function()
      awful.tag.incncol( 1, nil, true)
    end,
    {description = "increase the number of columns", group = "layout"}),

  awful.key({ modkey, altkey }, "Down",
    function()
      awful.tag.incncol( -1, nil, true)
    end,
    {description = "decrease the number of columns", group = "layout"}),

  -- Selection
  -- Select next layout
  awful.key({ modkey }, "space",
    function()
      awful.layout.inc(1)
    end,
    {description = "select next", group = "layout"}),

  -- Select previous layout
  awful.key({ modkey, "Shift" }, "space",
    function()
      awful.layout.inc(-1)
    end,
    {description = "select previous", group = "layout"}),


  -- Clients
  -- Focus
  -- Focus client by direction (vim keys)
  awful.key({ modkey }, "j",
    function()
      awful.client.focus.bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus down", group = "client"}),

  awful.key({ modkey }, "k",
    function()
      awful.client.focus.bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client"}),

  awful.key({ modkey }, "h",
    function()
      awful.client.focus.bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client"}),

  awful.key({ modkey }, "l",
    function()
      awful.client.focus.bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client"}),

  -- Focus client by direction (arrow keys)
  awful.key({ modkey }, "Down",
    function()
      awful.client.focus.bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus down", group = "client"}),

  awful.key({ modkey }, "Up",
    function()
      awful.client.focus.bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client"}),

  awful.key({ modkey }, "Left",
    function()
      awful.client.focus.bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client"}),

  awful.key({ modkey }, "Right",
    function()
      awful.client.focus.bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client"}),

  -- Focus client by index (cycle through clients)
  awful.key({ modkey }, "Tab",
    function()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}),

  awful.key({ modkey, "Shift" }, "Tab",
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}),

  -- restore minimized client
  awful.key({ modkey, "Shift" }, "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        client.focus = c
        c:raise()
      end
    end,
    {description = "restore minimized", group = "client"})
  ) -- end global keys


-- Clients Keys --
keys.clientkeys = gears.table.join(
  -- Toggle titlebar
  awful.key({ modkey, "Control" }, "t",
    function(c)
      awful.titlebar.toggle(c)
    end,
    {description = "toggle titlebars", group="client"}),

  -- Toggle fullscreen
  awful.key({ modkey }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),

  -- Close client
  awful.key({ modkey }, "q",
    function(c)
      c:kill()
    end,
    {description = "close", group = "client"}),

  -- Minimize
  awful.key({ modkey, }, "n",
    function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    {description = "minimize", group = "client"}),

  -- Maximize
  awful.key({ modkey, }, "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    {description = "(un)maximize", group = "client"}),

  awful.key({ modkey, "Control" }, "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    {description = "(un)maximize vertically", group = "client"}),

  awful.key({ modkey, "Shift"   }, "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    {description = "(un)maximize horizontally", group = "client"}),

  -- Move to master
  awful.key({ modkey, "Control" }, "Return",
    function(c)
      c:swap(awful.client.getmaster())
    end,
    {description = "move to master", group = "client"})
  ) -- end clients keys


-- Bind all key numbers to tags
for i = 1, 9 do
  keys.globalkeys = gears.table.join(keys.globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description = "view tag #"..i, group = "tag"}
      ),
    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description = "toggle tag #" .. i, group = "tag"}
      ),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description = "move focused client to tag #"..i, group = "tag"}
      ),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      {description = "toggle focused client on tag #" .. i, group = "tag"}
      )
    )
end

-- Set keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys
