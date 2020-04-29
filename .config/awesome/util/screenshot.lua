local awful = require("awful")
local naughty = require("naughty")

local screenshot = {}

local cmd = nil
local timestamp = os.date("%Y_%m_%d-%H_%M_%S")
local screenshot_dir = os.getenv("HOME") .. "/img/screenshot/"
local filename = screenshot_dir..timestamp..".png"
local maim_args = "-u -m 3"
local icon = require("icons").screenshot


function screenshot.full()
  cmd = "maim "..maim_args.." "..filename
  print(filename)
  naughty.notify({
      title = "Screenshot",
      message = "Screenshot taken!",
      icon = icon
    })
  awful.spawn.easy_async_with_shell(cmd, function(_, _, _, _)
  end)
end

function screenshot.selection()
  cmd = "maim "..maim_args.." -s "..filename
  naughty.notify({
      title = "Screenshot",
      message = "Select area to capture.",
      icon = icon
    })
  awful.spawn.easy_async_with_shell(cmd, function(_, _, _, exit_code)
    if exit_code == 0 then
      naughty.notify({
	  title = "Screenshot",
	  message = "Selection captured",
	  icon = icon
	})
    end
  end)
end

function screenshot.click()
  cmd = "maim -st 9999999 "..maim_args.." "..filename
  naughty.notify({
      title = "Screenshot",
      message = "Click on a window to select it",
      icon = icon
    })
  awful.spawn.easy_async_with_shell(cmd, function(_, _, _, exit_code)
    if exit_code == 0 then
      naughty.notify({
	  title = "Screenshot",
	  message = "Selection captured",
	  icon = icon
	})
    end
  end)
end

return screenshot
