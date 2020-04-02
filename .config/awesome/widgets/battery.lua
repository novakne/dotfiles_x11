-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- Shows the battery status using the ACPI tool
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/battery/"

local widget = wibox.widget {
  {
    id = "icon",
    widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.fixed.horizontal
}

local battery_popup = awful.tooltip({
    objects = { widget },
    mode = "outside",
    align = "right",
    preferred_positions = { "right", "left", "top", "bottom" },
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8)
  })

local function show_battery_warning()
  naughty.notify({
    title = "Battery is dying",
    message = "Houston, we have a problem",
    icon = icons_dir .. "battery_alert.svg",
  })
end

local last_battery_check = os.time()

watch(
  "acpi -i",
  1,
  function(_, stdout)
    local batteryIconName = "battery"
    local battery_info = {}
    local capacities = {}

    for s in stdout:gmatch("[^\r\n]+") do
      local status, charge_str, time = string.match(s, ".+: (%a+), (%d?%d?%d)%%,?.*")
      if status ~= nil then
        table.insert(battery_info, {status = status, charge = tonumber(charge_str)})
      else
        local cap_str = string.match(s, ".+:.+last full capacity (%d+)")
        table.insert(capacities, tonumber(cap_str))
      end
    end

    local capacity = 0
    for _, cap in ipairs(capacities) do
      capacity = capacity + cap
    end

    local charge = 0
    local status
    for i, batt in ipairs(battery_info) do
      if batt.charge >= charge then
        status = batt.status -- use most charged battery status
        -- this is arbitrary, and maybe another metric should be used
      end

      charge = charge + batt.charge * capacities[i]
    end
    charge = charge / capacity

    if (charge >= 0 and charge < 20) then
      if status ~= "Charging" and os.difftime(os.time(), last_battery_check) > 300 then
        -- if 5 minutes have elapsed since the last warning
        last_battery_check = _G.time()

        show_battery_warning()
      end
    end

    if status == "Charging" or status == "Full" then
      batteryIconName = batteryIconName .. "-charging"
    end

    local roundedCharge = math.floor(charge / 10) * 10
    if (roundedCharge == 0) then
      batteryIconName = batteryIconName .. "-outline"
    elseif (roundedCharge ~= 100) then
      batteryIconName = batteryIconName .. "-" .. roundedCharge
    end

    widget.icon:set_image(icons_dir .. batteryIconName .. ".svg")
    -- Update popup text
    battery_popup.text = string.gsub(stdout, "\n$", "")
    collectgarbage("collect")
  end,
  widget
  )

return widget
