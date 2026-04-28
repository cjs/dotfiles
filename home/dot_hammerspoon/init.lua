-- Hammerspoon configuration

-- App switcher: hyper + key focuses (or launches) the named application.
local hyper = {"control", "option", "cmd", "shift"}

-- App switcher: alt + key focuses (or launches) the named application.
local appHotkeys = {
  { key = "c", app = "Visual Studio Code - Insiders" },
  { key = "f", app = "Firefox" },
  { key = "g", app = "Microsoft Edge" },
  { key = "n", app = "Bear" },
  { key = "o", app = "Outlook (PWA)" },
  { key = "s", app = "Slack" },
  { key = "t", app = "iTerm" },
  { key = "z", app = "Microsoft Teams" },
}

for _, mapping in ipairs(appHotkeys) do 
  hs.hotkey.bind(hyper, mapping.key, function()
    hs.application.launchOrFocus(mapping.app)
  end)
end
