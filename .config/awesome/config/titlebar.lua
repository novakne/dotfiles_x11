local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local titlebar = {}

local function create(c, position, size)
  -- Buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({}, 1, function()
      c:activate { context = "titlebar", action = "mouse_move"  }
    end),
    awful.button({}, 3, function()
      c:activate { context = "titlebar", action = "mouse_resize"}
    end)
    )

  awful.titlebar(c, { position = position, size = size }):setup {
    -- Left
    nil,
    { -- Middle
      { -- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      -- awful.titlebar.widget.floatingbutton (c),
      awful.titlebar.widget.minimizebutton (c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.closebutton (c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
function titlebar.init()
  client.connect_signal("request::titlebars", function(c)
    create(c, "top", 26)
  end)
end

return titlebar
