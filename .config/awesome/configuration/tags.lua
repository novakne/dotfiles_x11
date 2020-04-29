local awful = require("awful")
local beautiful = require("beautiful")
local env = require("configuration.env")
local icons_dir = os.getenv("HOME") .. "/.config/awesome/icons/tags/" .. env.icons_color

-- Configure each tags
local tags = {
  {
    icon = icons_dir .. "/browser.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/editor.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/terminal.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/folder.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/music.svg",
    layout = awful.layout.suit.floating,
  },
  {
    icon = icons_dir .. "/media.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/star.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/heart.svg",
    layout = awful.layout.suit.tile.left,
  },
  {
    icon = icons_dir .. "/download.svg",
    layout = awful.layout.suit.max,
  }
}


-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
      awful.layout.suit.tile,
      awful.layout.suit.tile.left,
      awful.layout.suit.floating,
      -- awful.layout.suit.tile.bottom,
      -- awful.layout.suit.tile.top,
      -- awful.layout.suit.fair,
      -- awful.layout.suit.fair.horizontal,
      -- awful.layout.suit.spiral,
      -- awful.layout.suit.spiral.dwindle,
      awful.layout.suit.max,
      -- awful.layout.suit.max.fullscreen,
      -- awful.layout.suit.magnifier,
      -- awful.layout.suit.corner.nw,
    })
  end)

  -- Apply tag settings to each tag
  screen.connect_signal("request::desktop_decoration", function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(i, {
	  icon = tag.icon,
	  icon_only = true,
	  layout = tag.layout,
	  screen = s,
	  selected = i == 1,
	})
    end
  end)

  -- Remove useless gap in max layout
  tag.connect_signal("property::layout", function(t)
    local currentLayout = awful.tag.getproperty(t, "layout")
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = beautiful.useless_gap
    end
  end)
