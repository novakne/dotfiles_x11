-- Define icons folder directory
local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/"

-- Return icons
return {
  down_arrow  = icons_dir .. "down-arrow.svg",
  left_arrow  = icons_dir .. "left-arrow.svg",
  right_arrow = icons_dir .. "right-arrow.svg",
  screenshot  = icons_dir .. "screenshot.svg",
  up_arrow    = icons_dir .. "up-arrow.svg",
  dashboard   = icons_dir .. "dashboard.svg",
  dashboard_focus = icons_dir .. "dashboard_focus.svg",
  dashboard_round = icons_dir .. "dashboard_round.svg",
  dashboard_round_focus = icons_dir .. "dashboard_roundd_focus.svg",
}
