local awful = require("awful")

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
