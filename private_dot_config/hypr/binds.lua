local vars = require(".vars")

local mainMod = vars.mainMod
local alt = vars.alt

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
hl.bind(mainMod .. " + code:49", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(vars.menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + t", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(vars.terminal .. " -e calcurse"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -an"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("handy --toggle-transcription"))
hl.bind("F8", hl.dsp.pass({ window = "class:^(discord)$" }))

-- Smart navigation: same keys cycle group OR move focus
hl.bind(mainMod .. " + left", hl.dsp.exec_cmd("~/.config/hypr/scripts/smart-focus.sh l"))
hl.bind(mainMod .. " + a", hl.dsp.exec_cmd("~/.config/hypr/scripts/smart-focus.sh l"))

hl.bind(mainMod .. " + right", hl.dsp.exec_cmd("~/.config/hypr/scripts/smart-focus.sh r"))
hl.bind(mainMod .. " + s", hl.dsp.exec_cmd("~/.config/hypr/scripts/smart-focus.sh r"))

hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + w", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d", group_aware = true }))

-- Move window inside group
hl.bind(mainMod .. " + SHIFT + CTRL + left", hl.dsp.group.move_window({ forward = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + right", hl.dsp.group.move_window({ forward = true }))

-- Resize submap
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

    hl.bind("SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
    hl.bind("SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
    hl.bind("SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })
    hl.bind("SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind(mainMod .. " + R", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))

hl.bind(mainMod .. " + " .. alt .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. alt .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. alt .. " + 3", hl.dsp.focus({ workspace = 3 }))

hl.bind(mainMod .. " + " .. alt .. " + Q", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. alt .. " + W", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. alt .. " + E", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. alt .. " + A", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. alt .. " + S", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. alt .. " + D", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. alt .. " + Z", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + " .. alt .. " + X", hl.dsp.focus({ workspace = 11 }))
hl.bind(mainMod .. " + " .. alt .. " + C", hl.dsp.focus({ workspace = 12 }))

hl.bind("F1", hl.dsp.focus({ monitor = vars.MONITOR_1 }))
hl.bind("F2", hl.dsp.focus({ monitor = vars.MONITOR_2 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))

-- Move/resize windows with mainMod + LMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Screenshot a window
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -s"))
-- Screenshot a region
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("TEMP=/tmp/satty-$(date +%s).png && grimblast --freeze copysave area  ~/Pictures/Screenshots/$(date +'%y%m%d_%Hh%Mm%Ss')_screenshot.png && wl-paste > $TEMP && satty --filename $TEMP --copy-command wl-copy && rm $TEMP"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))
