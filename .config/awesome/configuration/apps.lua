local awful = require("awful")
local filesystem = require("gears.filesystem")

local rofi_dir = filesystem.get_configuration_dir().."/layouts/rofi/"

local apps = {
  terminal = "alacritty",
  editor   = "nvim",
  -- launcher = "rofi -normal-window -modi drun -show drun -theme "..rofi_dir.."app_drawer.rasi",
  launcher = "rofi -no-lazy-grab -show drun -theme "..rofi_dir.."app_drawer_vert.rasi",
  browser  = "vivaldi-stable",
  power_menu = rofi_dir.."power_menu/power_menu"
}

-- List of apps to start once on start-up
local run_on_start_up = {
  "picom",
}

-- Run all the apps listed in run_on_start_up when awesome starts
local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd), false)
end

for _, app in ipairs(run_on_start_up) do
  run_once(app)
end

return apps
