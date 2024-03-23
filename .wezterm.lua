-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- fonts
config.font = wezterm.font 'ComicShannsMono Nerd Font'
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true

-- test disabling some conflicting keys
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = '[',
    mods = 'SHIFT|SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- test disable all keymaps
config.disable_default_key_bindings = true
config.keys = {
  -- CTRL-SHIFT-l activates the debug overlay
  { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

-- and finally, return the configuration to wezterm
return config
