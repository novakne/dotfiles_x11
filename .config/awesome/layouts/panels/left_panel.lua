local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
-- local gears = require("gears")
local wibox = require("wibox")

-- Import widgets
local battery = require("widgets.battery")
local layoutbox = require("widgets.layoutbox")
local taglist = require("widgets.taglist")
local tasklist = require("widgets.tasklist")
local toggle_systray = require("widgets.toggle_systray")
local volume = require("widgets.volume")
local wifi = require("widgets.wifi")

local left_panel = {}

local function container(w, hmarge, vmarge)
  hmarge = hmarge or dpi(14)
  vmarge = vmarge or dpi(1)
  return wibox.container.margin(w, dpi(hmarge), dpi(hmarge), dpi(vmarge), dpi(vmarge))
end

function left_panel:init(s)

  -- Create a textclock widget
  local clock = wibox.widget.textclock('<span font="Inter 13">%H\n%M</span>')
  -- Tooltip with the date
  local clock_tooltip = awful.tooltip({
      objects = { clock },
      mode = "outside",
      align = "right",
      preferred_positions = {"right", "left", "top", "bottom"},
      margin_leftright = dpi(8),
      margin_topbottom = dpi(8),
      timer_function = function()
        return os.date("%A %d %B %Y")
      end,
    })

  -- Systemtray
  s.systray = wibox.widget.systray({
      horizontal = false,
      base_size = nil,
      visible = false
    })

  -- Create the wibox
  local leftpanel = awful.wibar({
      position = "left",
      screen = s,
      width = dpi(46),
      height = s.geometry.height,
      -- shape = function(cr, width, height)
      --   gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 14)
      -- end
    })

  leftpanel:setup({
      { -- Top
        {
          {
            container(clock, 0, 0),
            layout = wibox.container.place
          },
          container(layoutbox, 7, 0),
          tasklist(s),
          spacing = dpi(5),
          layout = wibox.layout.fixed.vertical
        },
        top = dpi(15),
        layout = wibox.container.margin
      },
      { -- Middle
        taglist(s),
        layout = wibox.layout.fixed.vertical,
      },
      { -- Bottom
        {
          container(s.systray),
          container(toggle_systray),
          container(volume),
          container(battery),
          container(wifi),
          spacing = dpi(5),
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
