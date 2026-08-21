-----------------
---- IMPORTS ----
-----------------
require("conf.env")
require("conf.looknfeel")
require("conf.vars")
require("conf.keybinds")
require("conf.input")
require("conf.windowrules")
require("conf.autostart")
require("conf.dynamic-cursor")
require("conf.hyprcapture")

telegramBase:set_enabled(true)
thunarTransparency:set_enabled(true)

------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "eDP-1",
    mode     = "2560x1440@60",
    position = "auto",
    scale    = "1",
})



