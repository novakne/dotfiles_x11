local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require('beautiful').xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local btn = require("util.btn")
local env = require("config.env")
local icon = require("icons")
local layoutlist = require("widgets.layoutlist")
local popup = require("util.popup")


local dashboard_popup = {}
local dashboard_widget = btn.img(icon.dashboard, icon.dashboard_focus)

local function tasklist_section(client, tag)
  local widget = wibox.widget {
    {
      {
        {
          {
            image = client.icon,
            forced_height = dpi(20),
            forced_width = dpi(20),
            widget = wibox.widget.imagebox
          },
          layout = wibox.layout.align.vertical
        },
        {
          forced_height = dpi(20),
          font = beautiful.font,
          valign = "center",
          markup = client.name,
          widget = wibox.widget.textbox
        },
        spacing = dpi(5),
        layout = wibox.layout.fixed.horizontal
      },
      margins = dpi(8),
      widget = wibox.container.margin,
    },
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 4)
    end,
    widget = wibox.container.background
  }

  widget:connect_signal("mouse::enter", function()
    widget.bg = beautiful.bg_focus
  end)
  widget:connect_signal("mouse::leave", function()
    widget.bg = beautiful.bg_normal
  end)
  widget:connect_signal("button::press", function()
    client:raise()
    tag:view_only()
    dashboard_popup.visible = false
  end)

  return widget
end

local function tag_section(tag, clients)
  local clients_container = wibox.layout.fixed.vertical()
  clients_container.spacing = 5

  for _, c in pairs(clients) do
    clients_container:add(tasklist_section(c, tag))
  end

  local markup = "<span foreground='%s'>Workspace %s</span>"
  return wibox.widget {
    {
      {
        {
          {
            font = beautiful.font,
            markup = markup:format(beautiful.fg_normal, tag.name),
            align = "center",
            widget = wibox.widget.textbox
          },
          bg = beautiful.bg_focus,
          shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 4)
          end,
          widget = wibox.container.background
        },
        left = dpi(80),
        right = dpi(80),
        forced_height = dpi(25),
        widget = wibox.container.margin
      },
      clients_container,
      spacing = dpi(5),
      layout = wibox.layout.fixed.vertical
    },
    margins = dpi(10),
    widget = wibox.container.margin
  }
end

local function settings_section()
  local task_manager = btn.text(beautiful.fg_normal, beautiful.fg_focus, " ", beautiful.font)
  task_manager:connect_signal("button::press", function()
    awful.spawn.with_shell(env.taskmanager)
    dashboard_popup.visible = false
  end)

  local power_menu = btn.text(beautiful.fg_normal, beautiful.fg_focus, "⏻ ", beautiful.font)
  power_menu:connect_signal("button::press", function()
    awful.spawn.with_shell(env.power_menu)
  end)

  local app_drawer = btn.text(beautiful.fg_normal, beautiful.fg_focus, " ", beautiful.font)
  app_drawer:connect_signal("button::press", function()
    awful.spawn(env.launcher)
    dashboard_popup.visible = false
  end)

  return wibox.widget {
    {
      {
	app_drawer,
	task_manager,
	power_menu,
	spacing = dpi(6),
	layout = wibox.layout.fixed.horizontal
      },
      margins = dpi(4),
      widget = wibox.container.margin
    },
    forced_height = dpi(32),
    widget = wibox.container.background
  }
end

local dashboard_layout = wibox.layout.fixed.vertical()

local function update_widget()
  dashboard_layout:reset(dashboard_layout)
  for _, tag in pairs(root.tags()) do
    local clients = tag:clients()
    if #clients > 0 then
      dashboard_layout:add(tag_section(tag, clients))
    end
  end
end

local systray = wibox.widget.systray({
    base_size = nil,
    visible = false,
    screen = s
  })


local dashboard_popup_widget = wibox.widget {
  {
    {
      {
	layoutlist,
	layout = wibox.layout.align.horizontal
      },
      nil,
      {
	settings_section(),
	layout = wibox.layout.align.horizontal
      },
      layout = wibox.layout.align.horizontal
    },
    {
      widget = wibox.widget.separator,
      color  = beautiful.yellow,
      forced_height = 1,
    },
    {
      dashboard_layout,
      layout = wibox.layout.fixed.vertical
    },
    {
      nil,
      nil,
      {
	btn.widget(systray),
	forced_height = dpi(32),
	layout = wibox.layout.align.horizontal
      },
      layout = wibox.layout.align.horizontal
    },
    spacing = dpi(10),
    layout = wibox.layout.fixed.vertical
  },
  margins = dpi(10),
  widget = wibox.container.margin
}

dashboard_popup = popup.make(dpi(40), dpi(2), nil, dpi(400), dashboard_popup_widget)

dashboard_widget:connect_signal("button::press", function()
  update_widget()
  dashboard_popup.visible = not dashboard_popup.visible
end)

return dashboard_widget
