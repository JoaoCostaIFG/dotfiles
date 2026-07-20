-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "DP-1", mode = "highres", position = "1080x480", scale = 1 })
hl.monitor({ output = "DP-2", mode = "highres", position = "0x0", scale = 1, transform = 1 })

-- dummy plug
-- hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "0x0", scale = 1, transform = 0 })
hl.monitor({ output = "DP-3", disabled = true })

hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })