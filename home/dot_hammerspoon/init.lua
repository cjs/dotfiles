-- Hammerspoon configuration

-- App switcher: alt + key focuses (or launches) the named application.
local appHotkeys = {
  { key = "b", app = "Google Chrome" },   -- alt-b → browser
  { key = "c", app = "Visual Studio Code" }, -- alt-c → code editor
  { key = "d", app = "Discord" },         -- alt-d → discord
  { key = "f", app = "Firefox" },         -- alt-f → firefox
  { key = "s", app = "Slack" },           -- alt-s → slack
  { key = "t", app = "WezTerm" },         -- alt-t → terminal
  { key = "z", app = "zoom.us" },         -- alt-z → zoom
}

for _, mapping in ipairs(appHotkeys) do
  hs.hotkey.bind({ "alt" }, mapping.key, function()
    hs.application.launchOrFocus(mapping.app)
  end)
end
