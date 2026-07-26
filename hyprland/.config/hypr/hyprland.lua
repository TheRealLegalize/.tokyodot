-----------------
---- IMPORTS ----
-----------------
require("conf/env")
require("conf/looknfeel")
require("conf/vars")
require("conf/keybinds")
require("conf/input")
require("conf/windowrules")
require("conf/autostart")
--require("noctalia.noctalia-colors").apply_theme()
-- require("./conf/magnifier")

telegramBase:set_enabled(true)
thunarTransparency:set_enabled(false)

------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "eDP-1",
    mode     = "2560x1440@60",
    position = "auto",
    scale    = "1",
})
