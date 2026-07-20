-- Noctalia color palette. These override general.col.* set in conf.d/settings.lua.
local primary         = "rgb(69d3ff)"
local surface         = "rgb(111415)"
local secondary       = "rgb(b4cad6)"
local error           = "rgb(ffb4ab)"
local tertiary        = "rgb(c6c2ea)"
local surface_lowest  = "rgb(0c0f10)"

hl.config({
    general = {
        col = {
            active_border   = primary,
            inactive_border = surface,
        },
    },

    group = {
        col = {
            border_active          = secondary,
            border_inactive        = surface,
            border_locked_active   = error,
            border_locked_inactive = surface,
        },

        groupbar = {
            col = {
                active          = secondary,
                inactive        = surface,
                locked_active   = error,
                locked_inactive = surface,
            },
        },
    },
})

-- tertiary and surface_lowest are defined for downstream consumers (e.g. shell
-- config) but are not referenced by hyprland itself; kept to preserve the
-- original palette surface area.
_ = { tertiary = tertiary, surface_lowest = surface_lowest }