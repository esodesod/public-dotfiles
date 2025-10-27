-- wezterm config for esod, mainly from play and learn, as we go.

-- pull in the wezterm API
local wezterm = require("wezterm")

-- this will hold the configuration.
local config = wezterm.config_builder()

-- color scheme:
-- config.color_scheme = "Gruvbox Dark (Gogh)"

-- fonts
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 22.0
config.hide_tab_bar_if_only_one_tab = true

-- don't confirm on window close
config.window_close_confirmation = "NeverPrompt"

-- in macOS, make left option key perform composition (AltGr)
-- see https://wezfurlong.org/wezterm/config/keyboard-concepts.html#microsoft-windows-and-ctrl-alt-altgr
config.send_composed_key_when_left_alt_is_pressed = true

-- disable the title bar, but enable the resizable border, should you need to resize the window using your mouse
-- see https://wezfurlong.org/wezterm/config/lua/config/window_decorations.html
-- config.window_decorations = "RESIZE"

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- testing file links
-- add file:// URIs into hyperlink_rules
table.insert(config.hyperlink_rules, {
	-- match file:// URIs.
	regex = "\\bfile://\\S*\\b",
	format = "$0",
})

-- opacity
config.window_background_opacity = 0.8

-- return the configuration to wezterm
return config
