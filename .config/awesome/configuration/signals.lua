local beautiful = require("beautiful")
local awful = require("awful")
-- local gears = require("gears")

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
  -- Round corners
  -- c.shape = function(cr,w,h)
  --   gears.shape.rounded_rect(cr,w,h,10)
  -- end
end)

-- No borders if only one tiled client
screen.connect_signal("arrange", function(s)
  for _, c in pairs(s.clients) do
    if #s.tiled_clients == 1 and c.floating == false and c.first_tag.layout.name ~= "floating" then
      c.border_width = 0
    elseif #s.tiled_clients > 1 or c.first_tag.layout.name == "floating" then
      c.border_width = beautiful.border_width
    end
  end
end)

-- Restore geometry for floating clients
-- (for example after swapping from tiling mode to floating mode)
tag.connect_signal('property::layout', function(t)
  for k, c in ipairs(t:clients()) do
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
      -- Geometry x = 0 and y = 0 most probably means that the
      -- clients have been spawned in a non floating layout, and thus
      -- they don't have their floating_geometry set properly.
      -- If that is the case, don't change their geometry
      local cgeo = awful.client.property.get(c, 'floating_geometry')
      if cgeo ~= nil then
        if not (cgeo.x == 0 and cgeo.y == 0) then
          c:geometry(awful.client.property.get(c, 'floating_geometry'))
        end
      end
      --c:geometry(awful.client.property.get(c, 'floating_geometry'))
    end
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)

