local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require('beautiful').xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local popup = {}

function popup.make(x, y, height, width, widget)
    local widget_container = wibox.widget {
        {
            color  = beautiful.bg_focus,
            forced_height = dpi(1),
            widget = wibox.widget.separator,
        },
        {
            widget,
            margins = dpi(10),
            widget = wibox.container.margin
        },
        forced_height = height,
        forced_width = width,
        layout = wibox.layout.fixed.vertical
    }

    local popup_widget = awful.popup {
        widget = widget_container,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
        end,
        visible = false,
        ontop = true,
        x = x,
        y = y
    }

    local mouse_in_popup = false
    local timer = gears.timer {
        timeout   = 1.25,
        single_shot = true,
        callback  = function()
            if not mouse_in_popup then
                popup_widget.visible = false
            end
        end
    }

    popup_widget:connect_signal("mouse::leave", function()
        if popup_widget.visible then
            mouse_in_popup = false
            timer:again()
        end
    end)

    popup_widget:connect_signal("mouse::enter", function()
        mouse_in_popup = true
    end)

    return popup_widget
end

function popup.separator()
    return wibox.widget {
        color  = beautiful.bg_focus,
        forced_height = dpi(1),
        widget = wibox.widget.separator,
    }
end

return popup
