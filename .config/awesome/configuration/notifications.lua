local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")
local ruled = require("ruled")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
    message = message,
    app_name = "System Notification",
    icon = beautiful.awesome_icon
  }
end)

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
  -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })

    in_error = false
  end)
end

ruled.notification.connect_signal('request::rules', function()

  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule       = { },
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }

  -- Critical notifications
  ruled.notification.append_rule {
    rule = { urgency = "critical" },
    properties = {
      bg = beautiful.notification_crit_bg,
      fg = beautiful.notification_crit_fg,
      timeout = 10,
      implicit_timeout = 10,
    }
  }

  -- Normal notifications
  ruled.notification.append_rule {
    rule = { urgency = "normal" },
    properties = {
      bg = beautiful.notification_bg,
      fg = beautiful.notification_fg,
      timeout = 5,
      implicit_timeout = 5,
    }
  }

  -- Low notifications
  ruled.notification.append_rule {
    rule = { urgency = "low" },
    properties = {
      bg = beautiful.notification_bg,
      fg = beautiful.notification_fg,
      timeout = 3,
      implicit_timeout = 3,
    }
  }

end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box {
    notification = n,
    border_width = beautiful.notification_border_width,
    border_color = beautiful.notification_border_color,
    position = beautiful.notification_position,
    shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, dpi(4)) end,
    widget_template = {
      { -- Background container
        { -- Min width container
          { -- Margin container
            { -- Icon container margin
              { -- Icon container
                { -- Icon
                  resize_strategy = "scale",
                  widget = naughty.widget.icon,
                }, -- Icon end
                widget = wibox.container.place,
              }, -- Icon container end
              margins = beautiful.notification_padding or dpi(3),
              widget = wibox.container.margin,
            }, -- Icon conatainer margin end
            { -- Text container margin
              { -- Container text
                { -- Title
                  align = "center",
                  widget = naughty.widget.title,
                }, -- Title end
                { -- Message
                  align = "center",
                  widget = naughty.widget.message,
                }, -- Message end
                spacing = beautiful.notification_spacing or dpi(3),
                layout = wibox.layout.flex.vertical,
              }, -- Container text end
              margins = beautiful.notification_padding or dpi(3),
              widget = wibox.container.margin,
            }, -- Text container margin end
            { -- List action
              naughty.list.actions,
              visible = n.actions and #n.actions > 0,
              layout = wibox.layout.align.horizontal,
            }, -- List action end
            layout = wibox.layout.align.vertical,
          },
          margins = dpi(20),
          widget = wibox.container.margin,
        }, -- Min width container
        strategy = "min",
        width = beautiful.notification_min_width or dpi(200),
        widget = wibox.container.constraint,
      }, -- Background container end
      strategy = "max",
      width = beautiful.notification_max_width or dpi(400),
      widget = wibox.container.constraint,
    } -- Widget template end
  } -- Naughty layout box end
end)
