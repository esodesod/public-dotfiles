-- open scrollback in nvim
-- based on docs from https://wezterm.org/config/lua/wezterm/on.html#custom-events
local wezterm = require("wezterm")
local io = require("io")
local os = require("os")
local act = wezterm.action

-- Function to find nvim in PATH or common locations
local function find_nvim()
	local nvim_path = "nvim"

	-- Try to find nvim in PATH first
	local handle = io.popen("which nvim 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		if result and #result > 0 then
			nvim_path = string.gsub(result, "\n$", "")
		end
	end

	-- If not found in PATH, check common locations
	if nvim_path == "nvim" then
		local common_paths = {
			"/usr/bin/nvim",
			"/usr/local/bin/nvim",
			"/opt/homebrew/bin/nvim",  -- macOS Homebrew
			"/opt/local/bin/nvim",     -- macOS MacPorts
		}

		for _, path in ipairs(common_paths) do
			local f = io.open(path, "r")
			if f then
				f:close()
				nvim_path = path
				break
			end
		end
	end

	return nvim_path
end

wezterm.on("trigger-nvim-with-scrollback", function(window, pane)
	-- Retrieve the text from the pane
	local text = pane:get_lines_as_text(pane:get_dimensions().scrollback_rows)

	-- Create a temporary file to pass to nvim
	local name = os.tmpname()
	local f = io.open(name, "w+")
	f:write(text)
	f:flush()
	f:close()

	-- Find nvim executable
	local nvim_exe = find_nvim()

	-- Open a new window running nvim and tell it to open the file
	window:perform_action(
		act.SpawnCommandInNewWindow({
			args = { nvim_exe, name },
		}),
		pane
	)

	-- Wait "enough" time for nvim to read the file before we remove it.
	-- The window creation and process spawn are asynchronous wrt. running
	-- this script and are not awaitable, so we just pick a number.
	--
	-- Note: We don't strictly need to remove this file, but it is nice
	-- to avoid cluttering up the temporary directory.
	wezterm.sleep_ms(1000)
	os.remove(name)
end)

return {
	keys = {
		{
			key = "E",
			mods = "CTRL",
			action = act.EmitEvent("trigger-nvim-with-scrollback"),
		},
	},
}
