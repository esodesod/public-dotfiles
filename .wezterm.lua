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

-- macOS left and right option keys.
-- see https://wezfurlong.org/wezterm/config/keyboard-concepts.html#microsoft-windows-and-ctrl-alt-altgr
config.send_composed_key_when_left_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
