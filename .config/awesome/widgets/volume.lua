local watch = require("awful.widget.watch")
local wibox = require("wibox")

local tooltp = require("util.tooltip")
local icons_dir = os.getenv("HOME") .. '/.config/awesome/icons/volume/'

local widget = wibox.widget {
  {
    id = "icon",
    widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.align.horizontal
}

local tooltip = tooltp.make(widget)

watch(
  [[bash -c "amixer -D pulse sget Master"]],
  1,
  function(_, stdout)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    if mute == "off" then
      widget.icon:set_image(icons_dir .. "mute.svg")
    else
      widget.icon:set_image(icons_dir .. "volume.svg")
    end
    tooltip.text = "Volume: " .. volume .."%"
    collectgarbage("collect")
  end,
  widget
  )

return widget
