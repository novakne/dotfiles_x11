-- Define icons folder directory
local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/"

-- Return icons
return {
  down_arrow  = icons_dir .. "down-arrow.svg",
  left_arrow  = icons_dir .. "left-arrow.svg",
  right_arrow = icons_dir .. "right-arrow.svg",
  screenshot  = icons_dir .. "screenshot.svg",
  up_arrow    = icons_dir .. "up-arrow.svg",
}
