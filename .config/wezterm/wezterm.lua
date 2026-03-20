-- wezterm config for esod, mainly from play and learn, as we go.

-- pull in the wezterm API
local wezterm = require("wezterm")

-- this will hold the configuration.
local config = wezterm.config_builder()

require("tabs").setup(config)


-- color scheme:
-- config.color_scheme = "Gruvbox Dark (Gogh)"

-- fonts
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true

-- don't confirm on window close
config.window_close_confirmation = "NeverPrompt"

-- in macOS, make left option key perform composition (AltGr)
-- see https://wezfurlong.org/wezterm/config/keyboard-concepts.html#microsoft-windows-and-ctrl-alt-altgr
config.send_composed_key_when_left_alt_is_pressed = true

-- disable the title bar, but enable the resizable border, should you need to resize the window using your mouse
-- see https://wezfurlong.org/wezterm/config/lua/config/window_decorations.html
config.window_decorations = "RESIZE"

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
-- config.window_background_opacity = 0.8

-- keys
config.keys = {
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
}

-- scrollback per tab
config.scrollback_lines = 9999
config.enable_scroll_bar = true
-- apply the scrollback configuration (including key bindings)
local scrollback = require("scrollback")
if scrollback and scrollback.keys then
	-- Ensure config.keys exists
	if not config.keys then
		config.keys = {}
	end
	for _, key_binding in ipairs(scrollback.keys) do
		table.insert(config.keys, key_binding)
	end
end

config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'nixos-testing',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = 'nixos-testing.esod.local',
    -- The username to use on the remote host
    username = 'esod',
  },
}

-- return the configuration to wezterm
return config
