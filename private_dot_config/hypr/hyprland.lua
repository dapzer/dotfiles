local vars = require(".vars")

local MONITOR_1 = vars.MONITOR_1
local MONITOR_2 = vars.MONITOR_2

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output = MONITOR_1,
    mode = "2560x1440@239.97",
    position = "0x0",
    scale = 1.25,
    bitdepth = 10,
})

-- hl.monitor({ output = MONITOR_1, disabled = true })

hl.monitor({
    output = MONITOR_2,
    mode = "2560x1440@143.97",
    position = "2048x0",
    scale = 1.25,
})

hl.workspace_rule({ workspace = "1", monitor = MONITOR_1, default = true })
hl.workspace_rule({ workspace = "2", monitor = MONITOR_1 })
hl.workspace_rule({ workspace = "3", monitor = MONITOR_1 })
hl.workspace_rule({ workspace = "4", monitor = MONITOR_1 })
hl.workspace_rule({ workspace = "5", monitor = MONITOR_1 })
hl.workspace_rule({ workspace = "6", monitor = MONITOR_1 })
hl.workspace_rule({ workspace = "7", monitor = MONITOR_2, default = true })
hl.workspace_rule({ workspace = "8", monitor = MONITOR_2 })
hl.workspace_rule({ workspace = "9", monitor = MONITOR_2 })
hl.workspace_rule({ workspace = "10", monitor = MONITOR_2 })
hl.workspace_rule({ workspace = "11", monitor = MONITOR_2 })
hl.workspace_rule({ workspace = "12", monitor = MONITOR_2 })

-- For all categories, see https://wiki.hypr.land/Configuring/
hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:win_space_toggle",
        kb_variant = "",
        kb_model = "",
        kb_rules = "",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = false,
        },

        sensitivity = -0.8,
        numlock_by_default = true,
        accel_profile = "flat",
    },

    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = "rgba(ffffffaa)",
            inactive_border = "rgba(595959aa)",
        },

        layout = "dwindle",

        allow_tearing = false,
    },

    decoration = {
        rounding = 0,
        rounding_power = 0,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = false,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },

    dwindle = {
        preserve_split = true,
        smart_split = true,
    },

    master = {
        allow_small_split = true,
        slave_count_for_center_master = 0,
        smart_resizing = false,
        drop_at_cursor = false,
        new_on_active = "after",
        orientation = "auto",
        new_status = "slave",
        mfact = 0.5,
    },

    group = {
        col = {
            border_active = "rgba(ffffffaa)",
            border_inactive = "rgba(47,52,63,1)",
        },

        groupbar = {
            enabled = true,
            gaps_in = 0,
            gaps_out = 0,
            col = {
                active = "rgba(ffffffaa)",
                inactive = "rgba(47,52,63,1)",
            },
            render_titles = false,
        },
    },

    misc = {
        force_default_wallpaper = 0,
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

require(".windowrules")
require(".env")
require(".exec")
require(".binds")
