local wezterm = require("wezterm")
local config = wezterm.config_builder()
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

-- Pane management
config.keys = {
	{
		mods = "CMD",
		key = "w",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "CMD|SHIFT",
		key = "t",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "CMD",
		key = "\\",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

smart_splits.apply_to_config(config, {
	-- directional keys to use in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		-- resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})

-- Aesthetics
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Monokai Pro (Gogh)"
config.colors = {
	background = "#2E2A2E",
	foreground = "#BBBBBB", -- Text color
	tab_bar = {
		active_tab = {
			bg_color = "#2E2A2E",
			fg_color = "#BBBBBB",
		},
		inactive_tab = {
			bg_color = "#211D21",
			fg_color = "#6E6D6E",
		},
		inactive_tab_hover = {
			bg_color = "#211D21",
			fg_color = "#6E6D6E",
		},
		new_tab = {
			bg_color = "#211D21",
			fg_color = "#6E6D6E",
		},
		new_tab_hover = {
			bg_color = "#211D21",
			fg_color = "#6E6D6E",
		},
	},
}
config.window_frame = {
	active_titlebar_bg = "#211D21",
	inactive_titlebar_bg = "#211D21",
}

return config
