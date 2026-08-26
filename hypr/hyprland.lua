local terminal = "foot"
local browser = "firefox"
local launcher = "rofi -show drun"
local fileManager = "thunar"
local bluetoothManager = "blueman-manager"

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "0x0",
	scale = 1,
})

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_QPA_PLATFORM", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_SIZE", "20")

hl.on("hyprland.start", function()
	local cmdeez = {
		"hyprpaper",
		"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
		"systemctl --user import-environment",
		"wl-paste --watch cliphist store",
		"waybar",
		"hypridle",
		"swaync",
		"systemctl --user start hyprpolkitagent",
		"hyprsunset",
	}

	for _, cmd in ipairs(cmdeez) do
		hl.exec_cmd(cmd)
	end
end)

hl.config({
	general = {
		border_size = 2,
		gaps_in = 1,
		gaps_out = 1,
		resize_on_border = true,
		layout = "dwindle",
		col = {
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	decoration = {
		rounding = 8,
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
	},

	input = {
		kb_options = "caps:swapescape",
		follow_mouse = 2,
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.2,
			clickfinger_behavior = true,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 0,
	},
})

hl.curve("behs", {
	type = "bezier",
	points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "behs" })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.window_rule({
	name = "floating-stuff",
	match = {
		class = fileManager .. "|" .. bluetoothManager,
	},
	float = true,
	size = { 900, 600 },
})

hl.bind("SUPER + A", hl.dsp.window.fullscreen_state({ action = "toggle", internal = 1, client = 0 }))
hl.bind("SUPER + C", hl.dsp.window.center())
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + X", hl.dsp.window.close())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + T", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + E", hl.dsp.layout("swapsplit"))

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + D", hl.dsp.exec_cmd(launcher))
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(bluetoothManager))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/rofi-power-menu.sh"))
hl.bind("CTRL + ALT + S", hl.dsp.exec_cmd("hyprshot -m region -o $XDG_PICTURES_DIR/Screenshots"))
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("hyprshot -m window -o $XDG_PICTURES_DIR/Screenshots"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.8 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.8 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl --class=backlight set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --class=backlight set 5%-"))

hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 9 do
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER + CTRL + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
