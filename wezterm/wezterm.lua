local wezterm = require("wezterm")
local act = wezterm.action
local function is_vim(pane)
	local process = pane:get_foreground_process_name()
	return process and process:find("n?vim") ~= nil
end

local function smart_pane_direction(direction, key)
	return wezterm.action_callback(function(window, pane)
		if is_vim(pane) then
			window:perform_action(act.SendKey({ key = key, mods = "CTRL" }), pane)
		else
			window:perform_action(act.ActivatePaneDirection(direction), pane)
		end
	end)
end

local config = wezterm.config_builder()
config.font_size = 15
config.color_scheme = "Tokyo Night"
config.enable_tab_bar = true

config.leader = {
	key = "b",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

config.keys = {
	-- split panes
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- navigate panes
	{ key = "h", mods = "CTRL", action = smart_pane_direction("Left", "h") },
	{ key = "j", mods = "CTRL", action = smart_pane_direction("Down ", "j") },
	{ key = "k", mods = "CTRL", action = smart_pane_direction("Up", "k") },
	{ key = "l", mods = "CTRL", action = smart_pane_direction("Right", "l") },

	-- resize mode
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- pane controls
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "w", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- send literal Ctrl+b to shell/programs
	{
		key = "b",
		mods = "LEADER|CTRL",
		action = act.SendKey({ key = "b", mods = "CTRL" }),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 3 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 3 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 3 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 3 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
}

return config
