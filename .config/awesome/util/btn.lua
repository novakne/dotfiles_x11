local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local btn = {}

function btn.make(image, size, margin, bg, bg_hover, bg_press, command)
  local btn_image = wibox.widget {
    image = image,
    forced_height = size,
    forced_width = size,
    widget = wibox.widget.imagebox
  }

  local btn_container = wibox.widget {
    {
      btn_image,
      margins = dpi(margin),
      widget = wibox.container.margin,
    },
    bg = bg,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, dpi(4))
    end,
    widget = wibox.container.background
  }

  btn_container:connect_signal("button::press", function()
    btn_container.bg = bg_press
    command()
  end)
  btn_container:connect_signal("button::leave", function()
    btn_container.bg = bg
  end)
  btn_container:connect_signal("mouse::enter", function()
    btn_container.bg = bg_hover
  end)
  btn_container:connect_signal("mouse::leave", function()
    btn_container.bg = bg
  end)

  btn.update_image = function(image)
    btn_image.image = image
  end

  return btn
end

function btn.widget(widget, hmarge, vmarge, command)
  hmarge  = hmarge or 12
  vmarge  = vmarge or 6
  command = command or nil

  local btn_widget = wibox.widget {
    {
      widget,
      left   = dpi(hmarge),
      right  = dpi(hmarge),
      top    = dpi(vmarge),
      bottom = dpi(vmarge),
      widget = wibox.container.margin,
    },
    bg = beautiful.bg_normal,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, dpi(10))
    end,
    widget = wibox.container.background
  }

  btn_widget:connect_signal("button::press", function()
    btn_widget.bg = beautiful.bg_focus
    if command then command() end
  end)
  btn_widget:connect_signal("button::leave", function()
    btn_widget.bg = beautiful.bg_normal
  end)
  btn_widget:connect_signal("mouse::enter", function()
    btn_widget.bg = beautiful.bg_focus
  end)
  btn_widget:connect_signal("mouse::leave", function()
    btn_widget.bg = beautiful.bg_normal
  end)

  return btn_widget
end

function btn.img(image, image_hover)
  local image_widget = wibox.widget {
    image = image,
    widget = wibox.widget.imagebox
  }

  image_widget:connect_signal("mouse::enter", function()
    image_widget.image = image_hover
  end)
  image_widget:connect_signal("mouse::leave", function()
    image_widget.image = image
  end)

  return image_widget
end

function btn.text(color, color_hover, text, font)
  local fmt = "<span foreground='%s'>%s</span>"
  local text_widget = wibox.widget {
    font = font or beautiful.font,
    markup = fmt:format(color, text),
    widget = wibox.widget.textbox
  }

  text_widget:connect_signal("mouse::enter", function()
    text_widget.markup = fmt:format(color_hover, text)
  end)
  text_widget:connect_signal("mouse::leave", function()
    text_widget.markup = fmt:format(color, text)
  end)

  return text_widget
end

return btn
