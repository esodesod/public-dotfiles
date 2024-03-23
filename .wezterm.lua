-- wezterm config for esod, mainly from play and learn, as we go.

-- pull in the wezterm API
local wezterm = require 'wezterm'

-- this will hold the configuration.
local config = wezterm.config_builder()

-- color scheme:
 config.color_scheme = 'Gruvbox Dark (Gogh)'

-- fonts
config.font = wezterm.font 'ComicShannsMono Nerd Font'
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true

-- in macOS, make left option key perform composition (AltGr)
-- see https://wezfurlong.org/wezterm/config/keyboard-concepts.html#microsoft-windows-and-ctrl-alt-altgr
config.send_composed_key_when_left_alt_is_pressed = true

-- return the configuration to wezterm
return config
