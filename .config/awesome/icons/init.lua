-- Define icons folder directory
local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/"

-- Return icons
return {
  brightness = icons_dir .. "brightness.png",
  close      = icons_dir .. "close.svg",
  down_arrow = icons_dir .. "down-arrow.svg",
  lock       = icons_dir .. "lock.png",
  logout     = icons_dir .. "logout.png",
  open       = icons_dir .. "open.svg",
  power      = icons_dir .. "power.png",
  restart    = icons_dir .. "restart.png",
  screenshot = icons_dir .. "screenshot.svg",
  sleep      = icons_dir .. "sleep.png",
  up_arrow   = icons_dir .. "up-arrow.svg",
}
