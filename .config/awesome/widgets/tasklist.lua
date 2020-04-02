local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gtable = require("gears.table")
local wibox = require("wibox")

-- Remove few symbols
-- beautiful.tasklist_plain_task_name=true

local tasklist = {}

function tasklist:buttons()
  local tasklist_buttons = gtable.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
	c.minimized = true
      else
	c:emit_signal("request::activate", "tasklist", { raise = true })
      end
    end),
    awful.button({}, 3, function()
      awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
    end))
    return tasklist_buttons
  end

  function tasklist:layout()
    local layout = {
      spacing = beautiful.tasklist_spacing or dpi(0),
      layout = wibox.layout.fixed.vertical
    }
    return layout
  end

  function tasklist:template()
    local template = {
      {
	{
	  awful.widget.clienticon,
	  margins = beautiful.tasklist_margin or dpi(12),
	  widget = wibox.container.margin,
	},
	id = 'background_role',
	widget = wibox.container.background,
      },
      layout = wibox.layout.align.horizontal,
    }
    return template
  end

  function tasklist:new(s)
    local widget = awful.widget.tasklist {
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = self:buttons(),
      layout = self:layout(),
      widget_template = self:template()
    }
    return widget
  end

  return setmetatable(tasklist, {
      __call = tasklist.new,
    })
