-- Use iGPU for laptop screen and dGPU for external monitors.
-- Alienware 13 R3 has HDMI and DP ports connected to dGPU so it's impossible to use iGPU for external monitors.
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

-- Use wayland backend for all applications, fallback to x11 if wayland is not available.
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("GDK_SCALE", 2)
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XCURSOR_SIZE", 24)

local terminal = "kitty"
local file_manager = "kitty fish -c 'yazi'"
local browser = "firefox"

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia-shell")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("udiskie")
end)

local primary_monitor = "eDP-1"

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
hl.monitor({
	output = primary_monitor,
	mode = "2560x1440@60",
	scale = 1.6,
	position = "0x0",
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
	debug = {
		full_cm_proto = true,
	},
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
	cursor = {
		no_hardware_cursors = true,
	},
	general = {
		gaps_in = 4,
		gaps_out = 6,
		border_size = 2,

		col = {
			active_border = "rgba(ffffffaa)",
			inactive_border = "rgba(ffffff55)",
		},

		layout = "dwindle",
	},
	decoration = {
		rounding = 8,
		rounding_power = 2,

		active_opacity = 0.75,
		inactive_opacity = 0.85,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,

		enable_swallow = true,
		swallow_regex = "^(" .. terminal .. ")$",
		swallow_exception_regex = "^(nvim.*)$",
	},
	dwindle = {
		preserve_split = true,
	},
	input = {
		kb_layout = "us",
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 to 1.0, 0 means no modification

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
		},
	},
	binds = {
		hide_special_on_workspace_change = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

-- Keybindings
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + b", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + e", hl.dsp.exec_cmd(file_manager))

local ipc = "noctalia-shell ipc call "
hl.bind("SUPER + Space", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind("SUPER + m", hl.dsp.exec_cmd(ipc .. "lockScreen lock"))
hl.bind("SUPER + Comma", hl.dsp.exec_cmd(ipc .. "controlCenter toggle"))

hl.bind("SUPER + q", hl.dsp.window.close())

-- Window navigation
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))

-- Window resizing
hl.bind("SUPER + f", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + v", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspace navigation
for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Scratchpad
hl.bind("SUPER + s", hl.dsp.workspace.toggle_special("scratch"))
hl.bind("SUPER + SHIFT + s", hl.dsp.window.move({ workspace = "special:scratch" }))

-- Toggle workspace between dwindle and scrolling
hl.bind("SUPER + Tab", function()
	local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
	if not workspace then
		return
	end
	local next_layout = workspace.tiled_layout == "dwindle" and "scrolling" or "dwindle"
	local selector = workspace.special and tostring(workspace.name) or tostring(workspace.id)

	hl.workspace_rule({ workspace = selector, layout = next_layout })
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprsunset gamma +10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprsunset gamma -10"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("SUPER + r", hl.dsp.force_renderer_reload())

hl.window_rule({
	name = "ignore-maximize-requests",
	match = {
		class = ".*",
	},
	suppress_event = "maximize"
})
hl.window_rule({
	name = "fix-xwayland-dragging",
	match = {
		class = "^$",
		title = "^$",
		xwayland = 1,
		float = 1,
		fullscreen = 0,
		pin = 0,
	},
	no_focus = true,
})
hl.window_rule({
	name = "only-blur-kitty",
	match = {
		class = "negative:^(kitty)"
	},
	opacity = "1.0 override"
})
hl.window_rule({
	name = "do-not-blur-neovim",
	match = {
		title = "^(nvim.*)$",
		class = "kitty",
	},
	opacity = "1.0 override"
})

-- Float all firefox windows except the first one, and float extension windows.
hl.on("window.open", function(w)
	if w.class ~= "firefox" then return end
	if w.initial_title ~= "Mozilla Firefox" then return end

	local ff_windows = hl.get_windows({ class = "firefox" })
	if #ff_windows <= 1 then return end

	local sub
	sub = hl.on("window.title", function(tw)
		if tw.address ~= w.address then return end
		if tw.title == ""
			or tw.title == "Mozilla Firefox"
			or tw.title == "about:blank"
			or tw.title:match("^about:.*Mozilla Firefox$") then
			return
		end

		if tw.title:match("^Extension:") then
			hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
			hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, window = tw }))
			hl.dispatch(hl.dsp.window.center({ window = tw }))
			hl.dispatch(hl.dsp.focus({ window = tw }))
			sub:remove()
		end
	end)
end)
