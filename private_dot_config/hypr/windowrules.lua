-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Obsidian → workspace 6
hl.window_rule({
    name = "obsidian",
    match = { class = "obsidian" },
    workspace = "6",
})

-- Discord + Telegram + Pachca + Keet → workspace 7
hl.window_rule({
    name = "TelegramDesktop",
    match = { class = "^(org\\.telegram\\.desktop)$" },
    workspace = "7",
    group = "set",
})

hl.window_rule({
    name = "Discord",
    match = { class = "discord" },
    workspace = "7",
    group = "set",
})

hl.window_rule({
    name = "pachca",
    match = { class = "Pachca" },
    workspace = "7",
    group = "set",
})

hl.window_rule({
    name = "Keet",
    match = { class = "Keet" },
    workspace = "7",
    group = "set",
})

-- Spotify → workspace 8
hl.window_rule({
    name = "Spotify",
    match = { class = "Spotify" },
    workspace = "8",
})

-- OBS Studio → workspace 10
hl.window_rule({
    name = "obs",
    match = { class = "com.obsproject.Studio" },
    workspace = "10",
})

-- AmneziaVPN → workspace 11
hl.window_rule({
    name = "amneziavpn",
    match = { class = "AmneziaVPN" },
    float = false,
    workspace = "11",
})

-- v2rayN → workspace 11
hl.window_rule({
    name = "v2rayN",
    match = { class = "v2rayN" },
    workspace = "11",
})

-- throne → workspace 11
hl.window_rule({
    name = "throne",
    match = { class = "Throne" },
    workspace = "11",
})

hl.window_rule({
    name = "windowrule-1",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "windowrule-2",
    match = { title = "^(Picture(-|\\s)in(-|\\s)(p|P)icture)$" },
    float = true,
    pin = true,
})

hl.window_rule({
    name = "windowrule-3",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    size = "(monitor_w*0.5) (monitor_h*0.5)",
})

hl.window_rule({
    name = "tilix",
    match = { class = "tilix" },
    opacity = "0.95 0.95",
})

hl.window_rule({
    name = "windowrule-4",
    match = { class = "nemo" },
    float = true,
    size = "(monitor_w*0.5) (monitor_h*0.5)",
})

hl.window_rule({
    name = "satty",
    match = { class = "com.gabm.satty" },
    float = true,
    size = "(monitor_w*0.75) (monitor_h*0.75)",
})

hl.window_rule({
    name = "TelegramDesktopMediaViewer",
    match = {
        class = "org.telegram.desktop",
        title = "^Media viewer$",
    },
    fullscreen = false,
})
