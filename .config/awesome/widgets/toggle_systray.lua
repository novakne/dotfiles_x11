local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local icons = require("icons")

local toggle_tray = wibox.widget {
  {
    screen = s,
    id = 'icon',
    image = icons.up_arrow,
    resize = true,
    widget = wibox.widget.imagebox,
  },
  layout = wibox.layout.align.vertical
}

local function toggle()
  local s = awful.screen.focused()
  if s.systray.visible then
    toggle_tray.icon:set_image(gears.surface.load_uncached(icons.down_arrow))
  else
    toggle_tray.icon:set_image(gears.surface.load_uncached(icons.up_arrow))
  end
  s.systray.visible = not s.systray.visible
end

toggle_tray:buttons(
  gears.table.join(
    awful.button({}, 1, nil, function()
      toggle()
    end)
    )
  )


return toggle_tray
