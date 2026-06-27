local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local act = wezterm.action

local config = wezterm.config_builder()
config.font = wezterm.font_with_fallback({ "UDEV Gothic 35NF", "FiraCode Nerd Font Mono" })
config.color_scheme = "Tokyo Night"
config.enable_tab_bar = true

local function platform_font_size()
	local target = wezterm.target_triple

	if target:find("apple") then
		return 14.5
	end

	if target:find("windows") then
		return 13.0
	end

	if target:find("linux") then
		return 13.0
	end

	return 14.0
end

config.font_size = platform_font_size()

config.leader = {
	key = "b",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}
config.keys = {
	-- clear screen
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SendKey({
			key = "l",
			mods = "CTRL",
		}),
	},
	--
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

	-- swap pane
	{
		key = "s",
		mods = "LEADER",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
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

-- you can put the rest of your Wezterm config here
smart_splits.apply_to_config(config, {
	-- https://github.com/mrjones2014/smart-splits.nvim#wezterm
	direction_keys = {
		move = { "h", "j", "k", "l" },
	},
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
	},
	-- log level to use: info, warn, error
	log_level = "info",
})

return config
