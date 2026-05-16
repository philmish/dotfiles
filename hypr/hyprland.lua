----------------
--- Monitors ---
----------------
---
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

----------------
--- Programs ---
----------------
---
local terminal        = "alacritty"
local rofi_launcher   = "rofi --show drun"
--local rofi_launcher = "~/.config/rofi/launchers/type-7/launcher.sh"
local file_manager    = "dolphin"
local waybar_launcher = "~/.launchers/waybar_launcher.sh"

------------------
--- Auto Start ---
------------------
---
hl.on("hyprland.start", function ()
 hl.exec_cmd("hyprpaper")
 hl.exec_cmd(waybar_launcher)
 hl.exec_cmd("wl-paste --type text --watch cliphist store")
 hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

----------------
--- Env Vars ---
----------------
---
---@type { [string]: string }
local env_vars = {
  ["XCURSOR_SIZE"]    = "24",
  ["HYPRCURSOR_SIZE"] = "24",
}

for key, default in pairs(env_vars) do
  hl.env(key, default)
end

---------------------
--- Input Devices ---
---------------------
---
hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",
    follow_mouse = 1,
    sensitivity  = 0,
    touchpad     = { natural_scroll = false },
  }
})

hl.gesture({
  fingers   = 3,
  direction = "horizontal",
  action    = "workspace",
})

--  Example for per-device config
-- hl.device({
--   name        = "epic-mouse-v1",
--   sensitivity = -0.5,
-- })

------------------------
--- Windows & Workspaces
------------------------
---
hl.window_rule({
  name          = "supress-maximize-events",
  match         = { class = ".*" },
  suppress_event = "maximize"
})

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false
  },
  no_focus = true
})

hl.window_rule({
  name      = "obsidian-on-ws-3",
  match     = { class = "obsidian" },
  workspace = "3 silent",
})

-------------------
--- Keybindings ---
-------------------
---

local main_mod = "SUPER"

--- Helper function for creating shortcut key sequences with main_mod at the
--- start.
---@param keys string[]
---@return string
local function main_mod_and(keys)
  local out = main_mod
  for _, key in ipairs(keys) do
    out = out .. " + " .. key
  end
  return out
end

hl.bind(main_mod_and{"SHIFT", "Q"}, hl.dsp.window.close())
hl.bind(main_mod_and{"RETURN"}, hl.dsp.exec_cmd(terminal))
hl.bind(main_mod_and{"E"}, hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod_and{"R"}, hl.dsp.exec_cmd(rofi_launcher))
hl.bind(main_mod_and{"F"}, hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod_and{"V"}, hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- switch focus to different window
hl.bind(main_mod_and{"left"}, hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod_and{"right"}, hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod_and{"up"}, hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod_and{"down"}, hl.dsp.focus({ direction = "down" }))

-- switch workspace
for i = 1, 10 do
  local key = tostring(i % 10) -- workspace 10 == key 0

  hl.bind(main_mod_and{key}, hl.dsp.focus({ workspace = i }))
  hl.bind(main_mod_and{"SHIFT", key}, hl.dsp.window.move({ workspace = i }))
end

-- scroll workspaces
hl.bind(main_mod_and{"mouse_down"}, hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod_and{"mouse_up"}, hl.dsp.focus({ workspace = "e-1" }))

hl.bind(main_mod_and{"F5"}, hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(main_mod_and{"S"}, hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod_and{"SHIFT", "S"}, hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod_and{"mouse:272"}, hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mod_and{"mouse:273"}, hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

---------------
--- Styling ---
---------------
---
hl.config({
  general = {
    gaps_in     = 2,
    gaps_out    = 4,
    border_size = 2,

    col = {
      active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = false,
    allow_tearing    = false,

    layout           = "dwindle",
  },

  dwindle = { preserve_split = true },
  master  = { new_status = "master" },


  misc    = {
    force_default_wallpaper = -1,
    disable_hyprland_logo   = false,
  },

  scrolling  = { fullscreen_on_one_column = true },
  decoration = {
    rounding         = 10,
    rounding_power   = 2,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    }
  }
})

------------------
--- Animations ---
------------------
---
hl.config({
  animations = {
    enabled = true,
  }
})

-- Defaults from: https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua
--
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
