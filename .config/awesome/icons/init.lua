-- Define icons folder directory
local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/"

-- Return icons
return {
  logout     = icons_dir .. "logout.png",
  sleep      = icons_dir .. "sleep.png",
  power      = icons_dir .. "power.png",
  lock       = icons_dir .. "lock.png",
  brightness = icons_dir .. "brightness.png",
  close      = icons_dir .. "close.svg",
  open       = icons_dir .. "open.svg",
  restart    = icons_dir .. "restart.png",
  screenshot = icons_dir .. "screenshot.svg",
  up_arrow = icons_dir .. "up-arrow.png",
  down_arrow = icons_dir .. "down-arrow.png",
}
