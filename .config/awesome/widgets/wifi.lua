-- Wifi Widget

local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/wifi/"

local interface = "wlp1s0"
local connected = false
local essid = "N/A"

local widget = wibox.widget {
  {
    id = "icon",
    widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.align.horizontal
}

awful.tooltip(
  {
    objects = { widget },
    mode = "outside",
    align = "right",
    timer_function = function()
      if connected then
        return "Connected to " .. essid
      else
        return "Wireless network is disconnected"
      end
    end,
    preferred_positions = { "right", "left", "top", "bottom" },
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8)
  }
  )

local function grabText()
  if connected then
    awful.spawn.easy_async(
      "iw dev " .. interface .. " link",
      function(stdout)
        essid = stdout:match("SSID:(.-)\n")
        if (essid == nil) then
          essid = "N/A"
        end
      end
      )
  end
end

watch(
  "awk 'NR==3 {printf \"%3.0f\" ,($3/70)*100}' /proc/net/wireless",
  5,
  function(_, stdout)
    local widgetIconName = "wifi-strength"
    local wifi_strength = tonumber(stdout)
    if (wifi_strength ~= nil) then
      connected = true
      -- Update popup text
      local wifi_strength_rounded = math.floor(wifi_strength / 25 + 0.5)
      widgetIconName = widgetIconName .. '-' .. wifi_strength_rounded
      widget.icon:set_image(icons_dir .. widgetIconName .. ".svg")
    else
      connected = false
      widget.icon:set_image(icons_dir .. widgetIconName .. "-off" .. ".svg")
    end
    if (connected and (essid == "N/A" or essid == nil)) then
      grabText()
    end
    collectgarbage("collect")
  end,
  widget
  )

widget:connect_signal(
  "mouse::enter",
  function()
    grabText()
  end
  )

return widget
