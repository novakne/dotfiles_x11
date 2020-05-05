local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi

local tooltip = {}

function tooltip.make(widget, hmarge, vmarge, fun)
  local tooltp = awful.tooltip({
      objects = { widget },
      mode = "outside",
      align = "right",
      preferred_positions = {"right", "left", "top", "bottom"},
      margin_leftright = hmarge or dpi(8),
      margin_topbottom = vmarge or dpi(8),
      timer_function = fun or nil
    })
  return tooltp
end

return tooltip
