local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local wibox = require("wibox")

local btn = require("util.btn")
local tooltp = require("util.tooltip")

-- Import widgets
local battery = require("widgets.battery")
local taglist = require("widgets.taglist")
local volume = require("widgets.volume")
local wifi = require("widgets.wifi")
local dashboard = require("widgets.dashboard")

local left_panel = {}

function left_panel:init(s)

  -- Create a textclock widget
  local clock = wibox.widget.textclock('<span font="Inter 13">%H\n%M</span>')
  -- Tooltip with the date
  local clock_tlp = tooltp.make(clock, dpi(8), dpi(8), function()
    return os.date("%A %d %b %Y")
  end)

  -- Create the wibox
  local leftpanel = awful.wibar({
      position = "left",
      screen = s,
      width = dpi(38),
      height = s.geometry.height,
    })

  leftpanel:setup({
      { -- Top
	{
	  top = 15,
	  widget = wibox.container.margin
	},
	{
	  btn.widget(clock, 0, 0),
	  widget = wibox.container.place
	},
	{
	  btn.widget(dashboard),
	  layout = wibox.layout.fixed.vertical
	},
	spacing = dpi(6),
	layout = wibox.layout.fixed.vertical
      },
      { -- Middle
        taglist.init(s),
        layout = wibox.layout.fixed.vertical,
      },
      { -- Bottom
        {
          btn.widget(volume),
          btn.widget(battery),
          btn.widget(wifi),
          layout = wibox.layout.fixed.vertical,
        },
        bottom = dpi(15),
        layout = wibox.container.margin
      },
      expand = "none",
      layout = wibox.layout.align.vertical
    })
end

return setmetatable(left_panel, {
    __call = left_panel.init,
  })
