local beautiful = require("beautiful")
local gears = require("gears")

screen.connect_signal("request::wallpaper", function(s)
  -- Wallpaper
  -- if beautiful.wallpaper then
  local wallpaper = beautiful.wallpaper
  -- If wallpaper is a function, call it with the screen
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  -- Method 1: Built in function
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Method 2: Set theme's wallpaper with feh
  -- awful.spawn.with_shell("feh --bg-fill " .. wallpaper)

  -- Method 3: Set last wallpaper with feh
  -- awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
end)

