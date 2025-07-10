local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

wezterm.on("update-right-status", function(window)
	local name = window:active_key_table()
	if name then
		name = name
		local status = wezterm.format({
			{ Background = { Color = "#8aadf4" } },
			{ Text = " " .. name .. " " },
		})
		window:set_right_status(status)
	else
		window:set_right_status("")
	end
end)

config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("JetBrains Mono NL Medium")
config.font_size = 20

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.window_frame = {
	active_titlebar_bg = "#181926",
	inactive_titlebar_bg = "Transparent",

	font_size = 18,
}

config.colors = {
	compose_cursor = "#ea76cb",
	tab_bar = {
		background = "Transparent",

		active_tab = {
			bg_color = "#24273a",
			fg_color = "#cad3f5",
		},
		inactive_tab = {
			bg_color = "Transparent",
			fg_color = "#6e738d",
		},
		inactive_tab_hover = {
			bg_color = "Transparent",
			fg_color = "#cad3f5",
		},
		new_tab = {
			bg_color = "Transparent",
			fg_color = "#cad3f5",
		},
		new_tab_hover = {
			bg_color = "#8aadf4",
			fg_color = "transparent",
		},
	},
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 10000000 }

local copy_mode = nil
if wezterm.gui then
	copy_mode = wezterm.gui.default_key_tables().copy_mode
	table.insert(copy_mode, { key = "[", mods = "CTRL", action = act.CopyMode("Close") })
	table.insert(copy_mode, { key = "q", action = act.CopyMode("Close") })
	table.insert(copy_mode, { key = "Escape", action = act.CopyMode("Close") })
end

config.keys = {
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "pane_resize",
			one_shot = false,
		}),
	},
	{
		key = "C",
		mods = "LEADER",
		action = act.SpawnCommandInNewTab({
			domain = "CurrentPaneDomain",
			cwd = wezterm.home_dir,
		}),
	},
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },

	{ key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
}

config.key_tables = {
	pane_resize = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "Escape", action = "PopKeyTable" },
		{ key = "[", mods = "CTRL", action = "PopKeyTable" },
	},
	copy_mode = copy_mode,
}

return config
