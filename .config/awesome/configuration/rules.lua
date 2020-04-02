local awful = require('awful')
local ruled = require("ruled")
local keys = require("configuration.keys")

local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

local addrule = ruled.client.append_rule

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  addrule {
    id = "global",
    rule = { },
    properties = {
      focus     = awful.client.focus.filter,
      raise     = true,
      keys      = keys.clientkeys,
      buttons   = keys.clientbuttons,
      screen    = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  }

  -- Floating clients.
  addrule {
    id       = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class    = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name    = {
        "Event Tester",  -- xev.
      },
      role    = {
        "AlarmWindow",    -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
        "GtkFileChooserDialog"
      },
      type = {
        "dialog"
      }
    },
    properties = { floating = true }
  }

  -- Centered clients
  addrule {
    rule_any = {
      class = {
        "Steam",
        "discord",
        "Nm-connection-editor",
        "Pavucontrol"
      },
      name = {
        "Bluetooth Devices"
      },
      role = {
        "GtkFileChooserDialog"
      },
      type = {
        "dialog",
      }
    },
    properties = {},
    callback = function (c)
      awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
    end
  }

  -- No titlebars for normal clients and dialogs
  addrule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false      }
  }

  -- File chooser dialog
  addrule {
    rule_any = { role = { "GtkFileChooserDialog" } },
    properties = {
      floating = true,
      width    = screen_width * 0.55,
      height   = screen_height * 0.65
    }
  }

  -- Rofi
  addrule {
    rule_any = { name = { "rofi" } },
    properties = {
      maximized         = true,
      ontop             = true,
      titlebars_enabled = false
    }
  }

  -- Mpv
  addrule {
    rule = { class = "mpv" },
    properties = {
      floating     = true,
      maximized    = true,
      ontop        = true,
      border_width = 0,
    },
    callback = function (c)
      awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
    end
  }

  -- Image viewers
  addrule {
    rule_any = {
      class = {
        "feh",
        "Sxiv",
      },
    },
    properties = {
      floating = true,
      width    = screen_width * 0.7,
      height   = screen_height * 0.75,
      ontop    = true,
    },
    callback = function (c)
      awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
    end
  }

end)

