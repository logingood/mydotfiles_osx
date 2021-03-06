hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- maximise currentwindow
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

local laptopScreen = "DELL U2515H"
local windowLayout = {
  {"Slack",  nil,          laptopScreen, hs.layout.left30,    nil, nil},
  {"iTerm2",    nil,          laptopScreen, hs.layout.right70,   nil, nil}
}
hs.layout.apply(windowLayout)
local laptopScreen = "U2879G6"
local windowLayout = {
  {"Slack",  nil,          laptopScreen, hs.layout.left40,    nil, nil},
  {"iTerm2",    nil,          laptopScreen, hs.layout.right60,   nil, nil}
}
hs.layout.apply(windowLayout)

local laptopScreen = "Color LCD"
local windowLayout = {
  {"Firefox",  nil,          laptopScreen, hs.layout.left40,    nil, nil},
  {"Spotify",  nil,          laptopScreen, hs.layout.right60,    nil, nil}
}
hs.layout.apply(windowLayout)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local laptopScreen = "DELL U2515H"
  local windowLayout = {
    {"Slack",  nil,          laptopScreen, hs.layout.left40,    nil, nil},
    {"iTerm2",    nil,          laptopScreen, hs.layout.right60,   nil, nil}
  }
  hs.layout.apply(windowLayout)

  local laptopScreen = "U2879G6"
  local windowLayout = {
    {"Slack",  nil,          laptopScreen, hs.layout.left40,    nil, nil},
    {"iTerm2",    nil,       laptopScreen, hs.layout.right60,   nil, nil}
  }
  hs.layout.apply(windowLayout)

  local laptopScreen = "Color LCD"
  local windowLayout = {
    {"Firefox",  nil,          laptopScreen, hs.layout.maximized,    nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

-- config reload
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- terminal + firefox same screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  --local laptopScreen = "DELL U2515H"
  --local windowLayout = {
--    {"iTerm2",    nil,          laptopScreen, hs.layout.right30,   nil, nil},
--    {"zoom.us",  nil,          laptopScreen, hs.layout.left70,    nil, nil}
--  }
--  hs.layout.apply(windowLayout)

  local laptopScreen = "U2879G6"
  local windowLayout = {
    {"iTerm2",    nil,          laptopScreen, hs.layout.right50,   nil, nil},
    {"zoom.us",  nil,          laptopScreen, hs.layout.left50,    nil, nil}
  }
  hs.layout.apply(windowLayout)

  local laptopScreen = "Color LCD"
  local windowLayout = {
    {"Firefox",  nil,         laptopScreen, hs.layout.left50,    nil, nil},
    {"Slack",  nil,          laptopScreen, hs.layout.right50,    nil, nil}
  }
  hs.layout.apply(windowLayout)
end)
