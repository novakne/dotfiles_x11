local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gtable = require("gears.table")
local wibox = require("wibox")

local modkey = require('configuration.keys').modkey

local taglist = {}

function taglist:buttons()
  local taglist_buttons = gtable.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
    )
  return taglist_buttons
end

function taglist:layout()
  local layout = {
    spacing = dpi(0),
    layout  = wibox.layout.fixed.vertical
  }
  return layout
end

function taglist:template()
  local template = {
    {
      {
        {
          id = "icon_role",
          widget = wibox.widget.imagebox,
        },
        layout = wibox.layout.fixed.horizontal,
      },
      margins = dpi(8),
      widget = wibox.container.margin
    },
    id = "background_role",
    widget = wibox.container.background,
    -- Add support for hover colors and an index label
    create_callback = function(self, c3, index, _)
      self:get_children_by_id("icon_role")[1].markup = "<b> "..c3.index.." </b>"
      self:connect_signal("mouse::enter", function()
        if self.bg ~= beautiful.taglist_bg_focus then
          self.backup = self.bg
          self.has_backup = true
        end
        self.bg = beautiful.taglist_bg_focus
      end)
      self:connect_signal("mouse::leave", function()
        if self.has_backup then self.bg = self.backup end
      end)
    end,
    update_callback = function(self, c3, index, _)
      self:get_children_by_id("icon_role")[1].markup = "<b> "..c3.index.." </b>"
    end,
  }
  return template
end

function taglist:new(s)
  local widget = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = self:buttons(),
    layout = self:layout(),
    widget_template = self:template()
  }
  return widget
end

return setmetatable(taglist, {
    __call = taglist.new,
  })
